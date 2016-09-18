class ProjectPolicy < ApplicationPolicy
   def index?
      @user.admin?
    end

    def show?
      @user.admin? || @record.users.include?(@user)
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
