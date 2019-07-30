class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  # TODO
  # before_destroy :should_not_destroy_if_stock, prepend: true

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      flash[:success] = "商品の登録をしました。"
      redirect_back(fallback_location: items_path)
    else
      flash[:error] = "商品の登録に失敗しました。"
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_back(fallback_location: items_path)
    else
      flash[:error] = "商品の更新に失敗しました。"
      render :show
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "商品は削除されました。"
    redirect_back(fallback_location: items_path)
  end

  private

  def item_params
    params.require(:item).permit(:name, :stock, :description, :hide)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
    redirect_back(fallback_location: sign_in_path)
    end
  end

  def admin_user
    redirect_back(fallback_location: root_url) unless current_user.admin?
  end

  # TODO
  # def should_not_destroy_if_stock
  #   throw(:abort) if stock?
  # end

end
