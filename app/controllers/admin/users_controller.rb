class Admin::UsersController < Admin::Base

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end
end
