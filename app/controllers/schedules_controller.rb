class SchedulesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @lab    = Lab.find(params[:lab_id])
    @schedule = @course.schedules.new(lab: @lab)
    authorize @schedule
  end

  def create
    @course = Course.find(params[:schedule][:course_id])
    @lab    = Lab.find(params[:schedule][:lab_id])
    @schedule = @course.schedules.new(lab: @lab)
    raise @schedule.inspect
    authorize @schedule
  end

end

