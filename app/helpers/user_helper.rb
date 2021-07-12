# frozen_string_literal: true

module UserHelper
  def already_rated_negatively(pizza)
    already_rated(pizza, '-')
  end

  def already_rated_postively(pizza)
    already_rated(pizza, '+')
  end

  def already_rated(pizza, rating)
    Rating.where(user: current_user, pizza: pizza, value: rating).any?
  end
end
