class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [:index, :edit, :update]
  before_filter :current_user,       :only => [:edit, :update]
  before_filter :signed_in?,         :only => [:edit, :update]

  def new
    @title = "Sign up"
  end

  def show
    @user = User.find(params[:id])
    @thankyous = @user.thankyous.page(params[:page])
    @title = @user.name
  end

  def index
    @title = "Who is using Merciboq?"
    @users = User.order("name").page(params[:page])
  end

end

