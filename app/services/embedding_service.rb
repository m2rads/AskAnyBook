require_relative './openai_service.rb'
require 'Singleton'

class EmbeddingService
    include Singleton

    MODEL_NAME = "curie"

    COMPLETIONS_MODEL = "text-davinci-003"

    DOC_EMBEDDINGS_MODEL = "text-search-#{MODEL_NAME}-doc-001"
    QUERY_EMBEDDINGS_MODEL = "text-search-#{MODEL_NAME}-query-001"


    def get_doc_embedding(text)
        return OpenAIService.instance.get_embedding(text, DOC_EMBEDDINGS_MODEL)
    end

    def get_query_embedding(text)
        return OpenAIService.instance.get_embedding(text, QUERY_EMBEDDINGS_MODEL)
    end
end 
