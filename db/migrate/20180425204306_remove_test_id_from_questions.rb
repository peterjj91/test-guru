class RemoveTestIdFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :test_id, :integer
  end
end
