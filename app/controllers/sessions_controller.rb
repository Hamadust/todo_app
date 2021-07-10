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
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = 'ログインしました'
        redirect_to index_path
      else
        flash.now[:danger] = 'メールアドレス、もしくはパスワードが間違っています'
        render 'new'
      end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
end
