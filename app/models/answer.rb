class Answer < ApplicationRecord
  ANSWERS_LIMIT = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  # validate :answers_limit, on: :create

  def self.answers_limit
    errors.add(:question, "Exceeded answers limit") if question.answers_count >= ANSWERS_LIMIT
  end
end
