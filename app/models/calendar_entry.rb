class CalendarEntry < ApplicationRecord
  belongs_to :schedule
  
  # cache only
  belongs_to :course
  belongs_to :lab

  def recreate_on_schedule
    schedule.ical
  end
end

