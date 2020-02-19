class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: [:who_impersonate, :impersonate, :stop_impersonating]

  helper DmUniboCommon::Engine.helpers
  include DmUniboCommon::Controllers::Helpers
  include UserPermissionHelper # current_user, current_organization

  impersonates :user

  before_action :log_current_user, :set_locale, :set_organization, :retrive_authlevels # , :redirect_unsigned_user, :retrive_authlevels
  # before_action :log_current_user, :set_locale, :set_organization, :redirect_unsigned_user, :retrive_authlevels

  def set_locale
    I18n.locale = :it
  end

  # no security hidden. 
  # We set organization with params[:__org__] as organization_id in config/routes
  def set_organization
    session[:user_id] = User.find_by_upn('pietro.donatini@unibo.it').id
    if params[:__org__]
      session[:oid] = params[:__org__].to_i 
    end
    # fallback to default organization
    session[:oid] ||= 1

    @current_organization = Organization.find(session[:oid].to_i)
    if current_user
      current_user.current_organization = @current_organization
    end
  end

  def retrive_authlevels
    if current_user
      current_user.authorization = DmUniboCommon::Authorization.new(request.remote_ip, current_user)
    end
  end
end
