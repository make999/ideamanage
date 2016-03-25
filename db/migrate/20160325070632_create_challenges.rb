class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.date :begin_period
      t.date :end_period
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
