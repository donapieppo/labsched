class User < ApplicationRecord
  include DmUniboCommon::User

  has_many :courses 
end
