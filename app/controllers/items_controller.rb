class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  # TODO
  # before_destroy :should_not_destroy_if_stock, prepend: true

  def new
    @item = Item.new
    @item.item_categories.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    @like = Like.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      flash[:error] = "商品の更新に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "商品は削除されました。"
    redirect_back(fallback_location: items_path)
  end

  private

  def item_params
    params.require(:item).permit(:name, :stocks, :price, :description, :hide, item_categories_attributes: [:id, :category_id])
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
