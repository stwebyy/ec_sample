class UsersController < ApplicationController
  before_action :correct_user
  def new
  end

  def index
  end

  def show
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end
