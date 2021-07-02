# frozen_string_literal: true

# Add sauce to Pizza model (source: https://naturaily.com/blog/ruby-on-rails-enum)
class AddSauceToPizzas < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE pizza_sauce AS ENUM ('tomate', 'creme_fraiche', 'originale');
    SQL
    add_column :pizzas, :sauce, :pizza_sauce
    add_index :pizzas, :sauce
  end

  def down
    remove_column :pizzas, :sauce
    execute <<-SQL
      DROP TYPE pizza_sauce;
    SQL
  end
end
