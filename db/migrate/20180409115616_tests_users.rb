class TestsUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :tests_users do |t|
      t.integer :test_id
      t.integer :user_id
    end
  end
end
