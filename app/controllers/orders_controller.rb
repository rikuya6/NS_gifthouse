class OrdersController < MemberController

  def index
    @orders = Order.includes(:product, :wrapping, :addresses)
      .where(user_id: params[:user_id]).page(params[:page])
  end

  def show
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
  end
end
