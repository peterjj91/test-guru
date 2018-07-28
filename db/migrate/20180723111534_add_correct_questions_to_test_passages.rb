class AddCorrectQuestionsToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :correct_questions, :int, :default => 0
  end
end
