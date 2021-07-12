# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :value, null: false
      t.references :user, foreign_key: true, null: false
      t.references :pizza, foreign_key: true, null: false
      t.timestamps
    end
    add_index :ratings, %i[user_id pizza_id], unique: true
  end
end
