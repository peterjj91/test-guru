class AddUniqueIndexOnTestPassageUserIdTestId < ActiveRecord::Migration[5.1]
  def change
    add_index :test_passages, %i[test_id user_id]
  end
end
