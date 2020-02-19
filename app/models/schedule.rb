# wrapper in db for ice_tea.
# on initializ and save updates start_time and end_time accordingly
class Schedule < ApplicationRecord
  belongs_to :course
  belongs_to :lab

  attr_accessor :ical                          # IceCube::Schedule
  serialize :ice_tea_sched_serialization, Hash # seralization attribute

  after_initialize :sync_with_icalendar,
                   :update_dates

  before_save :serialize_icecube,
              :update_dates

  def start_time
    self.ical.start_time
  end

  def end_time
    self.ical.end_time
  end

  attr_accessor :days
  serialize :days
  def self.weekdays
    Date::DAYNAMES.map { |d| d.upcase }
  end

  private

  # after initialize 
  # if we don't pass @ical we load it from serialization
  def sync_with_icalendar
    if (! @ical) && self.ice_tea_sched_serialization
      @ical = IceCube::Schedule.from_hash(self.ice_tea_sched_serialization)
    end
  end

  def serialize_icecube
    if @ical
      self.ice_tea_sched_serialization = @ical.to_hash
    end
  end

  def update_dates
    if @ical
      self.start_time = @ical.start_time
      self.end_time = @ical.end_time
    end
  end
end

