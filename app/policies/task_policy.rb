class TaskPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      @user.admin? || @user.tasks.include?(@record)
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

    def start?
       return false if @record.status.running?
       @user.admin?  || ( @record.user.nil? &&  @user.sprints.include?(@record.sprint) ||  @record.user == @user)
    end

    def stop?
      return false if !@record.status.running?
      @user.admin? || @record.user == @user
    end

    def finish?
      @user.admin? || @record.user == @user
    end
end
