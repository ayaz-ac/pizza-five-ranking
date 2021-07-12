# frozen_string_literal: true

class Pizza < ApplicationRecord
  enum sauce: { tomate: 'tomate', creme_fraiche: 'creme_fraiche', originale: 'originale' }

  has_many :ratings, dependent: :destroy

  before_save :avoid_negative_score

  def avoid_negative_score
    self.score = 0 if score.negative?
  end

  def self.sauce_names
    {
      'tomate': 'Tomate',
      'creme_fraiche': 'Crème Fraîche',
      'originale': 'Originale'
    }
  end
end
