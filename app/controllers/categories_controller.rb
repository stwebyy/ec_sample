class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "カテゴリの登録をしました。"
      redirect_back(fallback_location: categories_path)
    else
      flash[:error] = "カテゴリの登録に失敗しました。"
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
