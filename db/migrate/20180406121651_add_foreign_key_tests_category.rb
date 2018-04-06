class AddForeignKeyTestsCategory < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :tests, :category, foreign_key: true
  end
end
