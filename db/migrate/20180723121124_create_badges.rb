class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :rule_name
      t.string :rule_parameter
      t.string :badge_image
      t.timestamps
    end
  end
end
