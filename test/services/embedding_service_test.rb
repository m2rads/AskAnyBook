require_relative '../../app/services/embedding_service.rb'
require 'Daru'


$embedding = EmbeddingService.instance


def test_get_doc_embedding(text)
  return $embedding.get_doc_embedding(text)
end

def test_query_embedding(text)
  return $embedding.get_query_embedding(text)
end

def test_vector_similariy(x, y)
  return $embedding.vector_similarity(x, y)
end

def test_load_embeddings(fname)
  return $embedding.load_embeddings(fname)
end 

def test_construct_prompt(question, context, df)
  return $embedding.construct_prompt(question, context, df)
end

def test_answer_query_with_context(query, df, document_embeddings)
  response = $embedding.answer_query_with_context(query, df, document_embeddings)

  return response
end

query = "How to start a Saas business?"
df = Daru::DataFrame.from_csv('./lib/assets/getting-real.pdf.pages.csv')
document_embeddings = $embedding.load_embeddings("./lib/assets/getting-real.pdf.embeddings.csv")

puts test_answer_query_with_context(query, df, document_embeddings)