class SiteController < ApplicationController
  def index
    @question = {
      question_text: "What is getting real about?"
    }
  end
end
