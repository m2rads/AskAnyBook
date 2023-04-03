class Question < ApplicationRecord
    validates :question_text, presence: true, length: { maximum: 140 }
    attribute :context, :text, default: ''
    validates :answer, length: { maximum: 2000 }
    validates :ask_count, numericality: { only_integer: true }
end
  