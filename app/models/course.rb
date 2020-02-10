class Course < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  def to_s
    name
  end
end
