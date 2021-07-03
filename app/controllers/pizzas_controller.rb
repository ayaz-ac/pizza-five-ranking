# frozen_string_literal: true

# Pizzas Controller
class PizzasController < ApplicationController
  def index
    @pizzas = Pizza.all
  end
end
