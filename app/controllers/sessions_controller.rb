class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.administrator?
        redirect_to :admin_root
      else
        redirect_to :root
      end
      flash[:notice] = 'ログインしました。'
    else
      flash.now[:alert] = 'メールアドレスとパスワードが一致しません'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました。'
    redirect_to :root
  end
end
