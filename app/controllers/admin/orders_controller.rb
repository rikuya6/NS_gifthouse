class Admin::OrdersController < Admin::Base

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @orders = @user.orders.includes(:product, :wrapping, :addresses).page(params[:page])
    else
      @orders = Order.includes(:product, :wrapping, :addresses).page(params[:page])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
  end


end
