class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root, notice: 'ユーザを新規作成しました。'
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to (@user.administrator? ? :admin_root : :root), notice: 'ユーザ情報を更新しました。'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
