# frozen_string_literal: true

# Pizza model migration
class CreatePizzas < ActiveRecord::Migration[6.0]
  def change
    create_table :pizzas do |t|
      t.string :title
      t.text :composition
      t.text :img_url

      t.timestamps
    end
  end
end
