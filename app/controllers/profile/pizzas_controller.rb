# frozen_string_literal: true

module Profile
  class PizzasController < ApplicationController
    before_action :authenticate_user!

    def index
      find_pizzas
    end

    private

    def find_pizzas
      @pizzas = Pizza.joins(:ratings).where(ratings: { user: current_user })
    end
  end
end
