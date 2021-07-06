class SessionsController < ApplicationController

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
    log_out if logged_in?
    redirect_to #login_url
  end
end
