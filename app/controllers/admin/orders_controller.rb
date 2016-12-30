class Admin::OrdersController < Admin::Base

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @orders = @user.orders.includes(:product, :wrapping).page(params[:page])
    else
      @orders = Order.includes(:user, :product, :wrapping).page(params[:page])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = '注文を削除しました。'
    if params[:user_id].present?
      redirect_to admin_user_orders_path(params[:user_id])
    else
      redirect_to admin_orders_path
    end
  end
end
