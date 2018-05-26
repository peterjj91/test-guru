class ChangeForeignKeyTestPassages < ActiveRecord::Migration[5.1]
  def up
    remove_foreign_key :test_passages, name: "test_passages_on_conversation_id"
  end
end
