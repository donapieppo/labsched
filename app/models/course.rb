class Course < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  has_many :schedules

  def to_s
    name
  end
end
