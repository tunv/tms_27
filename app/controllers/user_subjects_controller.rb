class UserSubjectsController < ApplicationController
  before_action :set_user_subject, only: [:edit, :update]

  def edit
  end

  def update
    if @user_subject.update_attributes usersubject_param
      flash[:success] = I18n.t "update_succes"
      redirect_to users_path
    else 
      render :edit
    end
  end

  private
  def set_user_subject
    @user_subject = UserSubject.find params[:id]
  end

  def usersubject_param
    params.require(:user_subject).permit :status, :user_id, :subject_id
  end
end
