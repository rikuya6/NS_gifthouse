class OrdersController < MemberController
  before_action :user_authorization, only: [:index, :show, :destroy]

  def index
    @orders = Order.includes(:product, :wrapping)
      .where(user_id: params[:user_id]).page(params[:page])
  end

  def show
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
  end

  def new
    @order = current_user.orders.build(product_id: params[:product_id])
    @wrapping = Wrapping.all.pluck(:name, :id)
  end

  def create
    @order = current_user.orders.build(order_params)
    @wrapping = Wrapping.all.pluck(:name, :id)
    if params[:back].present?
      render 'new'
    elsif @order.save
      redirect_to user_order_path(@order.user_id, @order.id), notice: '注文を承りました。'
    else
      render 'new'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = '注文をキャンセルしました。'
    redirect_to user_orders_path
  end

  def new_confirmation
    @order = current_user.orders.build(order_params)
    @wrapping = Wrapping.all.pluck(:name, :id)
    render 'new' if @order.invalid?
  end


  private

  def order_params
    attrs = [:product_id, :wrapping_id, :dest, :zipcode, :payment]
    attrs << [:confirm]
    attrs << { product_attributes: [:id] }
    params.require(:order).permit(attrs)
  end
end
