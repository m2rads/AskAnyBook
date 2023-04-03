require 'tokenizer'
require 'pdftotext'
require 'tempfile'
require 'optparse'
require 'daru'
require 'csv'
require_relative '../../app/services/openai_service.rb'

COMPLETIONS_MODEL = "text-davinci-003"

MODEL_NAME = "curie"

DOC_EMBEDDINGS_MODEL = "text-search-#{MODEL_NAME}-doc-001"

$de_tokenizer = Tokenizer::WhitespaceTokenizer.new

# count the number of tokens in a string"
def count_tokens(text)
  return $de_tokenizer.tokenize(text).length()
end

# Extract the text from the page
def extract_pages(page_text, index)
  if page_text.length == 0
    return []
  end

  content = page_text.split.join(" ")
  # puts "page text: #{content}"
  outputs = [{"title": "Page #{index}", "content": content, "tokens": count_tokens(content)+4}]

  return outputs
end

options = {}

opt_parser = OptionParser.new do |opts|
  opts.on("-p", "--pdf FILENAME", "Name of PDF") do |pdf|
    options[:pdf] = pdf
  end
end

opt_parser.parse!

filename = options[:pdf]

pages = Pdftotext.pages(filename)

res = []
pages.each_with_index do |page, index|
  res += extract_pages(page.text.gsub(/[\n\t]/ , " "), index + 1)
end

res = res.select { |row| row[:tokens] < 2046 }

df = Daru::DataFrame.new(res)

CSV.open("#{filename}.pages.csv", "wb") do |csv|
  csv << ["title", "content", "tokens"] 
  res.each do |row|
    csv << [row[:title], row[:content], row[:tokens]]
  end
end

def get_doc_embedding(text) 
    return OpenAIService.instance.get_embedding(text, DOC_EMBEDDINGS_MODEL)
end 

def compute_doc_embeddings(df)
    """
    Create an embedding for each row in the dataframe using the OpenAI Embeddings API.
  
    Return a dictionary that maps between each embedding vector and the index of the row that it corresponds to.
    """
    embeddings = {}
    idx = 1
    df.each_row_with_index do |r, idx|
        embeddings[idx] = get_doc_embedding(r[:content])
        # puts r[:content]
      end
    return embeddings
end

doc_embeddings = compute_doc_embeddings(df)

CSV.open("#{filename}.embeddings.csv", "w") do |csv|
    csv << ["title"] + (0..4095).to_a
    doc_embeddings.each do |i, embedding|
      csv << ["Page #{i + 1}"] + embedding
    end
  end