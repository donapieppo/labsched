class CoursesController < ApplicationController
  def index
    @courses = current_user.current_organization.courses
    authorize @courses
  end

  def show 
    @course = Course.find(params[:id])
    authorize @course
  end
end
