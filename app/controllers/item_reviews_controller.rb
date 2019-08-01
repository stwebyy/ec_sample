class ItemReviewsController < ApplicationController
  def new
    @review = ItemReview.new
  end

  def create
    @review = ItemReview.new(item_review_params)
    if @review.save
      flash[:success] = "商品の登録をしました。"
      redirect_to item_path(params[:item_id])
    else
      flash[:error] = "商品の登録に失敗しました。"
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def item_review_params
    params.require(:item_review).permit(:review, :item_id)
  end
end
