# frozen_string_literal: true

class PizzasController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  def index
    @sauces = Pizza.sauce_names
    @pizzas = if params[:title].present?
                Pizza.where('title like ?', "%#{params[:title].capitalize}%")
              elsif params[:sauce].present?
                Pizza.send(params[:sauce])
              else
                Pizza.all
              end
    @pizzas = @pizzas.order(score: :desc)

    respond_to do |format|
      format.html
      format.json do
        render json:
        {
          user: user_signed_in?,
          pizzas: @pizzas
        }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
end
