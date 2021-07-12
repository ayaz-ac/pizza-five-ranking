# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :pizza

  before_save :calculate_score

  validates :user, uniqueness: { scope: :pizza }

  # rubocop:disable Style/RedundantSelf
  def calculate_score
    self.value == '+' ? pizza.score += 1 : pizza.score -= 1
    pizza.save!
  end
  # rubocop:enable Style/RedundantSelf
end
