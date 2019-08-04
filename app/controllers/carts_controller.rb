class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @cart_items = current_cart.cart_items
  end

  def add_item
    @cart = current_cart
    @item = Item.find(params[:item_id])
    @cart_items = @cart.cart_items.build
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id], cart_id: current_cart.id)
    end
    @cart_items.stocks += params[:stocks].to_i
    @cart_items.save
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(stocks: params[:stocks].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def cart_params
    params.require(:cart).permit(cart_items: [:id, :item_id, :cart_id])
  end

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end
