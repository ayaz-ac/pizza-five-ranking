# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  def index
    @pizzas = Pizza.limit(15)
  end
end
