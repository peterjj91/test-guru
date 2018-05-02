class AddTestIdQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :test_id, :integer
  end
end
