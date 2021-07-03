# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pizzas#index'

  resources :pizzas, only: %i[index]
end
