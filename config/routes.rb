# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :items
  resources :shops
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users ,  only: [:get]
end
