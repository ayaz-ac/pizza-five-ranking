# frozen_string_literal: true

# Pizza model
class Pizza < ApplicationRecord
  enum sauce: { tomate: 'tomate', creme_fraiche: 'creme_fraiche', originale: 'originale' }

  has_many :ratings

  def self.sauce_names
    {
      'tomate': 'Tomate',
      'creme_fraiche': 'Crème Fraîche',
      'originale': 'Originale'
    }
  end
end
