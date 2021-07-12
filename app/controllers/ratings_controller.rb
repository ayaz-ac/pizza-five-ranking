# frozen_string_literal: true

class RatingsController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  def create
    body = JSON.parse(request.body.read)
    pizza_id = body['pizza_id']
    rating = Rating.where(user: current_user, pizza_id: pizza_id).first_or_initialize
    if rating.value != body['rating']
      rating.value = body['rating']
      rating.save!
    end
    respond_to do |format|
      format.json { render json: { score: Pizza.find(pizza_id).score } }
    end
  end
  # rubocop:enable Metrics/AbcSize
end
