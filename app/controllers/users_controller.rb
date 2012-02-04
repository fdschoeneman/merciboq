class UsersController < ApplicationController

  before_filter :authenticate_user!,
                :only => [:index, :edit, :update, :destroy]
  before_filter :current_user,       :only => [:edit, :update]
  before_filter :signed_in?,         :only => [:edit, :update]
  before_filter :admin_user,         :only => :destroy

  def new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    params[:user][:name] = temporary_name
    super
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.find_by_subdomain!(request.subdomain)
    end
    @thankyous = @user.thankyous.page(params[:page])
    @welcomes = @user.welcomes.page(params[:page])
    @title = @user.name
    @subdomain_logo = @user.subdomain
  end

  def index
    @title = "Who is using Merciboq?"
    @users = User.order("name").page(params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end

