class HomeController < ApplicationController
  def index
    skip_authorization
    month = (params[:m] || 1).to_i 
    @beginning_of_the_day = Date.new(2020, month, 1)
    @first_day_of_week = @beginning_of_the_day.wday
  end
end
