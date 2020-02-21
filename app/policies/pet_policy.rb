class PetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Pet.all
    end
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def index?
    return show?
  end

  def show?
    return true
  end

  def edit?
    return update?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def ownerview
    return true
  end
end
