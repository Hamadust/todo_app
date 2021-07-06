class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @tasks = Task.where(user_id: current_user.id)
    end
  end
end
