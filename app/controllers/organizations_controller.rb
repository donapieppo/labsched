class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
    authorize @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    authorize @organization
  end
end
