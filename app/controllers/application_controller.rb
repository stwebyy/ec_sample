# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_turbolinks_header
  
  protect_from_forgery with: :exception

  helper_method :current_cart

  def set_turbolinks_header
    response.set_header('Turbolinks-Location', request.fullpath)
  end

  def current_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
  end
end
