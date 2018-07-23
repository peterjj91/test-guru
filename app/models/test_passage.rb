class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question

  before_create :set_starting_time

  MINIMUM_PERCENT_OF_PASSAGE = 0.85

  def completed?
    current_question.nil?
  end

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    save!
  end

  def result
    (self.correct_questions.to_f / questions_count) * 100
  end

  def passed?
    true if passed_minimum_percent_condition? && passed_time_condition?
  end

  def number_of_questions
    test.questions.size
  end

  def current_progress
    current_question_index.to_f / number_of_questions * 100
  end

  def questions_count
    test.questions.count
  end

  def current_question_index
    test.questions.index(current_question) + 1 unless completed?
  end

  def remaining_time
    (self.test.passage_time - (Time.current - self.created_at).seconds).to_i
  end
  
  def finish!
    self.end_time = Time.current
    self.save
  end

  private

  def before_validation_set_first_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end

  def set_starting_time
    self.start_time = Time.current
  end
  
  def passed_minimum_percent_condition?
    correct_question_percent = self.correct_questions / test.questions.count
    correct_question_percent >= MINIMUM_PERCENT_OF_PASSAGE
  end
  
  def passed_time_condition?
    if test.with_time_limit?
      (end_time - start_time) <= test.passage_time
    else
      true
    end
  end

end
