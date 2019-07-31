# frozen_string_literal: true

Rails.application.routes.draw do
  get 'item_categories/create'
  get 'item_categories/destroy'
  # resources :users, only: [:index, :show]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  resources :items
  resources :categories,  only: [:new, :create]
  root 'items#index'
  resources :categories do
    resource :item_categories, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users ,  only: [:get]
end
