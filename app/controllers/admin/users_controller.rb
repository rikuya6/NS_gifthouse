class Admin::UsersController < Admin::Base

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'ユーザを更新しました。'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path, notice: 'ユーザを削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:email, :administrator, :password, :password_confirmation)
  end
end
