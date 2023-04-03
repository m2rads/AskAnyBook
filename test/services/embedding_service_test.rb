require_relative '../../app/services/embedding_service.rb'

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


x = test_query_embedding("Hello, who are you?")
y = test_query_embedding("what is getting real about?")

print test_vector_similariy(x, y)
