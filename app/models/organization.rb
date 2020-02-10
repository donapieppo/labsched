class Organization < ApplicationRecord
  include DmUniboCommon::Organization

  has_many :permissions

  has_many :courses
end
