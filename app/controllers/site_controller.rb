class SiteController < ApplicationController
  def index
    @question = Question.find(1)
  end
end
