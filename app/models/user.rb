class User < ApplicationRecord
  include DmUniboCommon::User

  has_many :permissions
  has_many :courses 

  # livello di accesso (integer definito in Authentication)
  attr_accessor :authorization 
  attr_accessor :current_organization
end
