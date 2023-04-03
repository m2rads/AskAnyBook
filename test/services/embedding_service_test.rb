require_relative '../../app/services/embedding_service.rb'

$embedding = EmbeddingService.instance


def test_get_doc_embedding(text)
  return $embedding.get_doc_embedding(text)
end

def test_query_embedding(text)
  return $embedding.get_query_embedding(text)
end

print test_get_doc_embedding("test string")
print test_query_embedding("test query")
