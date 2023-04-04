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

    previous_question = Question.find_by(question_text: question_asked)

    if previous_question
      print "previously asked and answered \n === \n " + previous_question.answer + " \n==="
      previous_question.ask_count = previous_question.ask_count + 1
      print "\n ask count" + previous_question.ask_count.to_s + " \n=== "
      previous_question.save()
      render json: {
        question: previous_question.question_text,
        answer: previous_question.answer,
        id: previous_question.id
      }
      return
    end

    puts question_asked
    head :ok
  end
end
