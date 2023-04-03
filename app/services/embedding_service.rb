require_relative './openai_service.rb'
require 'numo/narray'
require 'csv'
require 'daru'
require 'Singleton'

class EmbeddingService 
    include Singleton

    MODEL_NAME = "curie"

    COMPLETIONS_MODEL = "text-davinci-003"

    DOC_EMBEDDINGS_MODEL = "text-search-#{MODEL_NAME}-doc-001"
    QUERY_EMBEDDINGS_MODEL = "text-search-#{MODEL_NAME}-query-001"

    MAX_SECTION_LEN = 500
    SEPARATOR = "\n* "
    SEPARATOR_LEN = 3

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

    def order_document_sections_by_query_similarity(query, contexts)
        query_embedding = get_query_embedding(query)
    
        document_similarities = contexts.map do |doc_index, doc_embedding|
        similarity = vector_similarity(query_embedding, doc_embedding)
        [similarity, doc_index]
        end.sort_by { |similarity, _| -similarity }
    
        document_similarities
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

    def construct_prompt(question, context_embeddings, df)
        """
        Fetch relevant embeddings
        """
        most_relevant_document_sections = order_document_sections_by_query_similarity(question, context_embeddings)
      
        chosen_sections = []
        chosen_sections_len = 0
        chosen_sections_indexes = []
      
        most_relevant_document_sections.each do |_, section_index|
            document_section = df.where(df["title"].eq(section_index))
            chosen_sections_len += document_section["tokens"][0] + SEPARATOR_LEN
            if chosen_sections_len > MAX_SECTION_LEN
                space_left = MAX_SECTION_LEN - chosen_sections_len - SEPARATOR_LEN
                chosen_sections.append(SEPARATOR + document_section["content"][0][0..space_left])
                chosen_sections_indexes.append(section_index.to_s)
                break
            end
      
          chosen_sections.append(SEPARATOR + document_section["content"][0])
          chosen_sections_indexes.append(section_index.to_s)
        end

        return  chosen_sections
    end
end


  