class SiteController < ApplicationController
  def index
    @question = Question.find(1)
  end

  def ask 
    embedding_service = EmbeddingService.instance

    question_asked = params[:question].presence || ""
    if !question_asked.end_with?("?")
      question_asked += "?"
    end

    puts question_asked
    head :ok
  end
end
