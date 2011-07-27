class UsersController < ApplicationController

#  before_filter :authenticate_user!

  def new
    @title = "Sign up"
  end

  def show
    @user = User.find(params[:id])
  end

end

