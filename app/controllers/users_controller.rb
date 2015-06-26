class UsersController < ApplicationController
  before_action :logged_in_user, except: :index

  def show
    @user = User.find params[:id]
    @course = @user.courses.current_course.first
    @activities = @user.activities
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "update_succes"
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
