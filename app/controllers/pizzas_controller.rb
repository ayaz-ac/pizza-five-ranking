# frozen_string_literal: true

# Pizzas Controller
class PizzasController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def index
    @sauces = Pizza.sauce_names
    @pizzas = if params[:title].present?
                Pizza.where('title like ?', "%#{params[:title].capitalize}%")
              elsif params[:sauce].present?
                Pizza.send(params[:sauce])
              else
                Pizza.all
              end

    respond_to do |format|
      format.html
      format.json { render json: { pizzas: @pizzas } }
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
