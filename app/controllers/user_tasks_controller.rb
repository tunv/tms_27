class UserTasksController < ApplicationController
  before_action :set_user_task, only: [:edit, :update]

  def new
    @user_task = UserTask.new
  end

  def create
    @user_task = UserTask.new usertask_param
    if @user_task.save
      flash[:success] = I18n.t "create_course_succ"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user_task.update_attributes usertask_param
      flash[:success] = I18n.t "update_succes"
      redirect_to users_path
    else 
      render :edit
    end
  end

  private
  def set_user_task
    @user_task = UserSubject.find params[:id]
  end

  def usertask_param
    params.require(:user_task).permit :finish, :user_id, :task_id
  end
end
