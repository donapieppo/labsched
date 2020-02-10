class LabPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user && @user.cesia?
  end

  def update?
    @user && @user.cesia?
  end
end

