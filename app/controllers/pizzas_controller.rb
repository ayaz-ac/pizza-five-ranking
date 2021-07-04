# frozen_string_literal: true

# Pizzas Controller
class PizzasController < ApplicationController
  def index
    @pizzas = if params[:query].present?
                Pizza.where('title like ?', "%#{params[:query].capitalize}%")
              else
                Pizza.all
              end

    respond_to do |format|
      format.html
      format.json { render json: { pizzas: @pizzas } }
    end
  end
end
