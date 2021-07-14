# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :pizza

  before_save :calculate_score

  validates :user, uniqueness: { scope: :pizza }

  def calculate_score
    value == '+' ? pizza.score += 1 : pizza.score -= 1
    pizza.save!
  end
end
