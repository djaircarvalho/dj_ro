class DefaultController < ApplicationController
  def index
    @tasks = current_user.tasks.not_finished.where(user: nil).
      or(current_user.tasks.not_finished.where(user: current_user))
  end
end
