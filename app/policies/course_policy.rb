class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def edit?
    owner_or_organization_manager?
  end
end

