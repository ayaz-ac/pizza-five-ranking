# frozen_string_literal: true

class Pizza < ApplicationRecord
  enum sauce: { tomate: 'tomate', creme_fraiche: 'creme_fraiche', originale: 'originale' }

  has_many :ratings, dependent: :destroy

  def self.sauce_names
    {
      'tomate': 'Tomate',
      'creme_fraiche': 'Crème Fraîche',
      'originale': 'Originale'
    }
  end

  def as_json(_options = {})
    super({
      except: %i[created_at updated_at],
      include: {
        ratings: {
          only: %i[value user_id]
        }
      }
    })
  end
end
