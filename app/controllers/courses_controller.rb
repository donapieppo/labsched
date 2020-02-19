class CoursesController < ApplicationController
  before_action :get_course_and_check_permission, only: [:show, :edit, :update, :destroy]

  def index
    @courses = current_user.current_organization.courses
    authorize @courses
  end

  def show 
    @course = Course.find(params[:id])
    authorize @course
  end

  def new
    @course = course.new
    authorize @course
  end

  def create
    @course = course.new(course_params)
    authorize @course
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path
    else
      render :edit
    end
  end

  private

  def get_course_and_check_permission
    @course = Course.find(params[:id])
    authorize @course
  end

  def course_params
    params[:course].permit(:code, :name)
  end
end
