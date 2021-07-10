# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :users
  belongs_to :pizzas

  validates :rating, uniqueness: { scope: %i[users_id pizzas_id] }
end
