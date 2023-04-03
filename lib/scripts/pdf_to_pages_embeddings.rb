require 'tokenizer'
require 'pdftotext'
require 'tempfile'
require 'optparse'
require 'daru'
require 'csv'

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
# getting filename from command line options
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