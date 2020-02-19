class Lab < ApplicationRecord
  has_many :schedules

  def to_s
    name
  end
end
