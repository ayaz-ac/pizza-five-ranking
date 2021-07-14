# frozen_string_literal: true

module UserHelper
  def pizza_rating(pizza)
    Rating.where(user: current_user, pizza: pizza).first&.value
  end
end
