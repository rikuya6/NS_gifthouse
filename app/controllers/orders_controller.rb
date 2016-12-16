class OrdersController < MemberController

  def index
    @orders = Order.where(user_id: params[:user_id]).includes(:product, :wrapping, :addresses).page(params[:page])
  end
end
