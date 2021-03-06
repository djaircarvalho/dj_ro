class SprintPolicy < ApplicationPolicy
  def index?
      true
    end

    def show?
      @user.admin? || @user.sprints.include?(@record)

    end

    def new?
      @user.admin?
    end

    def destroy?
      @user.admin?
    end

    def edit?
      @user.admin?
    end
end
