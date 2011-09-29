class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [:index, :edit, :update]
  before_filter :current_user,       :only => [:edit, :update]
  before_filter :signed_in?,         :only => [:edit, :update]

  def new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    params[:user][:name]      = temporary_name
    super
  end

  def show
    @user = User.find_by_subdomain!(request.subdomain)
 #   @user = User.find(params[:id])
    @thankyous = @user.thankyous.page(params[:page])
    @welcomes = @user.welcomes.page(params[:page])
    @title = @user.name
  end

  def index
    @title = "Who is using Merciboq?"
    @users = User.order("name").page(params[:page])
  end

  def temporary_name(email)
    email = @user.email.split('@')
    local_part = email[0]
    @name = local_part
  end

end

