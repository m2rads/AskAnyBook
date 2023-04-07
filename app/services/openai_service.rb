require 'singleton'
require 'openai'
require 'dot_env'


class OpenaiService
    include Singleton

    current_environment = DotEnv.get_environment

    unless defined?(OPENAI_API_KEY)
        OPENAI_API_KEY = ENV["OPENAI_API_KEY"]
    end

    def initialize
        @client = OpenAI::Client.new(access_token: OPENAI_API_KEY)
    end

    def get_embedding(text, model)
        result = @client.embeddings(
            parameters: {
                model: model,
                input: text
            }
        )
        return result["data"][0]["embedding"]
    end

    def get_completion(prompt, model)
        response = @client.completions(
            parameters: {
                model: model,
                prompt: prompt,
                max_tokens: 150
        })

        return response["choices"].map { |c| c["text"] }
    end
end
