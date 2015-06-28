class UserSubjectsController < ApplicationController
  def show
    @usersubject = UserSubject.find params[:id]
    @subject = Subject.find_by(id: @usersubject.subject_id)
    current_user.training @subject
  end

  def update
    @subject = UserSubject.find params[:id]
    if @subject.update_attributes usersubject_params
      flash[:success] = t "update_succes"
      redirect_to @subject
    end
  end
  
  private
  def usersubject_params
    params.require(:user_subject).permit :status
  end
end
