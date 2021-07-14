# frozen_string_literal: true

class PizzasController < ApplicationController
  def index
    @sauces = Pizza.sauce_names
    @pizzas = find_pizzas
    @pizzas = @pizzas.includes(:ratings).order(score: :desc)

    respond_to do |format|
      format.html
      format.json do
        render json: pizzas_json
      end
    end
  end
end

private

def find_pizzas
  if params[:title].present?
    Pizza.where('title like ?', "%#{params[:title].capitalize}%")
  elsif params[:sauce].present?
    Pizza.send(params[:sauce])
  else
    Pizza.all
  end
end

def pizzas_json
  filter_ratings if user_signed_in?
  {
    user: {
      signedIn: user_signed_in?,
      id: user_signed_in? ? current_user.id : ''
    },
    pizzas: @pizzas
  }
end

def filter_ratings
  @pizzas.each do |pizza|
    pizza.ratings.select { |rating| rating.user == current_user }
  end
end
