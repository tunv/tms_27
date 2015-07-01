class Admin::SubjectsController < ApplicationController
  before_action :set_subject, except: [:new, :index, :create]
  
  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def show
  end

  def edit
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "Admin.subject_create"
      redirect_to [:admin, @subject]
    else
      render :new
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = t "Admin.subject_delete"
    redirect_to request.referrer || admin_root_url
  end

  def update
    if @subject.update_attributes(subject_params)
      flash[:success] = t "Admin.update_success"
      redirect_to [:admin, @subject]
    else
      render :edit
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description, :status, user_ids: [],
      tasks_attributes: [:id, :name, :description, :status, :_destroy]
  end

  def set_subject
    @subject = Subject.find params[:id]
  end
end
