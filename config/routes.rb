# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pizzas#index'

  resources :pizzas, only: %i[index]
  resources :ratings, only: %i[create]

  namespace :profile do
    resources :pizzas, only: %i[index]
  end
end
