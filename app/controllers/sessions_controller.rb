class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def new
    if logged_in?
      flash.now[:success] = 'ログイン済みです'
      redirect_to index_path
    end
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        remember user
        flash.now[:success] = 'Login'
        redirect_to index_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
