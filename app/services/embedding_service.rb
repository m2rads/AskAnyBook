require_relative './openai_service.rb'
require 'Singleton'
require 'numo/narray'
require 'csv'
require 'daru'

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

    def vector_similarity(x, y)
        x_array = Numo::NArray.cast(x)
        y_array = Numo::NArray.cast(y)
        
        return x_array.dot(y_array)
    end

    def load_embeddings(fname)
        """
        Read the document embeddings and their keys from a CSV.
      
        fname is the path to a CSV with exactly these named columns:
            up to the length of the embedding vectors.
        """

        data = {}
        max_dim = 0
        CSV.foreach(fname, headers: true) do |row|
          title = row["title"]
          embedding = row.select { |k, v| k != "title" }.map { |k, v| v.to_f }
          max_dim = embedding.size - 1 if embedding.size - 1 > max_dim
          data[title] = embedding
        end
        data.transform_values! { |v| v + [0.0] * (max_dim - v.size + 1) }
        return data
    end

end 
