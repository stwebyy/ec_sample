# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    resources :item_reviews,  only: [:new, :index, :create, :update, :destroy]
    resources :likes, only: [:create, :destroy]
    post '/add_item' => 'carts#add_item'
    post '/update_item' => 'carts#update_item'
    delete '/delete_item' => 'carts#delete_item'
  end
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
  resources :categories,  only: [:new, :create] do
    resource :item_categories, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  resources :carts, only: [:show]
end
