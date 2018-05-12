class AddAnswerBody < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :body, :string
  end
end
