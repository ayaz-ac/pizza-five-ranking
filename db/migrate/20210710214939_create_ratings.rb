# frozen_string_literal: true

# Add sauce to Pizza model
class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
    end
    add_reference :ratings, :user
    add_reference :ratings, :pizza
    add_index :ratings, %i[user_id pizza_id], unique: true
  end
end
