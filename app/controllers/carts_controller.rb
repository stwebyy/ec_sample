class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
  before_action :set_search

  def show
    @cart_items = current_cart.cart_items
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end
    @cart_item.stocks += params[:stocks].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(stocks: params[:stocks].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to cart_path(session[:cart_id])
  end

  def bill_confirm
    @cart_items = current_cart.cart_items
    all_price = 0
    @cart_items.each do |c|
      @total_price = c.stocks * c.item.price
      @all_price = @all_price.to_i + @total_price.to_i
    end
  end

  def pay
    Payjp.api_key = "sk_test_fb0dd938a4a447658641aa92"
    charge = Payjp::Charge.create(
      :amount => params[:amount],
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
    if charge
      @cart_items = current_cart.cart_items
      @cart_items.each do |item|
        result_stock = item.item.stocks.to_i - item.stocks.to_i
        item.item.update_attribute(:stocks, result_stock)
        item.destroy
      end
      
    end
    redirect_to root_path, notice: 'ご購入、ありがとうございました。'
  end


  private

  def cart_params
    params.require(:cart).permit(cart_items: [:id, :item_id, :cart_id])
  end

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end
