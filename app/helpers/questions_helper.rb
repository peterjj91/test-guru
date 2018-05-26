module QuestionsHelper
  def question_header(question)
    action_title = question.new_record? ? 'Create a new question for the test: ' : 'Edit question for test'
    action_title << " #{question.test.title}"
  end
end