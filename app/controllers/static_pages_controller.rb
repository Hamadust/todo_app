class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to index_path
    end
  end
end
