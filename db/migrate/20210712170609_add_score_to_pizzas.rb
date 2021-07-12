# frozen_string_literal: true

class AddScoreToPizzas < ActiveRecord::Migration[6.0]
  def change
    add_column :pizzas, :score, :integer, default: 0
  end
end
