module QuestionsHelper
  def question_header(question)
    action_title = question.new_record? ? t('helpers.label.question.new.header') : t('helpers.label.question.edit.header')
    action_title << " #{question.test.title}"
  end
end