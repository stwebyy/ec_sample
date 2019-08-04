# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items do
    resources :item_reviews,  only: [:new, :index, :create, :update, :destroy]
  end

  get 'item_categories/create'
  get 'item_categories/destroy'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  resources :items do
    resources :likes, only: [:create, :destroy]
    post :pay, on: :member
  end
  resources :categories,  only: [:new, :create]
  root 'items#index'
  resources :categories do
    resource :item_categories, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users ,  only: [:get]
end
