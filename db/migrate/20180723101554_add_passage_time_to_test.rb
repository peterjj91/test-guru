class AddPassageTimeToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :passage_time, :int
  end
end
