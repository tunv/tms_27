class UserTasksController < ApplicationController
  before_action :set_user_task, only: [:edit, :update]

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
    @user_task = UserTask.find params[:id]
  end

  def usertask_param
    params.require(:user_task).permit :status, :user_id, :task_id
  end
end
