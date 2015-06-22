class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:new, :destroy, :edit]
  before_action :set_user, except: [:new, :index, :create]

  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate page: params[:page]
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = t "update_succes"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "Admin.user_delete"
    redirect_to request.referrer || root_url 
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :supervisor
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "login_please"
      redirect_to login_url
    end
  end

  def admin_user
    unless current_user.supervisor?
    flash[:danger] = t "Admin.not_supervisor"
    redirect_to admin_root_url
    end
  end

  def set_user
    @user = User.find params[:id]
  end
end
