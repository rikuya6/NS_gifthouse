class OrdersController < MemberController
  before_action :user_authorization, only: [:show]

  def index
    @orders = Order.includes(:product, :wrapping, :addresses)
      .where(user_id: params[:user_id]).page(params[:page])
  end

  def show
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
  end

  def new
    @order = current_user.orders.build(product_id: params[:product_id])
    @order.addresses.build
    @order.build_wrapping
    @wrapping = Wrapping.all.pluck(:name, :id)
  end

  def create
    @order = current_user.orders.build(order_params)
    @wrapping = Wrapping.all.pluck(:name, :id)
    #return render 'new' unless @order.addresses.present?
    if params[:back].present?
      render 'new'
    elsif @order.save
      redirect_to user_order_path(@order.user_id, @order.id), notice: '注文を承りました。'
    else
      render 'new'
    end
  end


  private

  def order_params
    attrs = [:product_id, :wrapping_id]
    attrs << [:confirm]
    attrs << { product_attributes: [:id, :name, :price, :weight, :stock, :note] }
    attrs << { addresses_attributes: [:id, :order_id, :dest, :zipcode, :_destroy] }
    params.require(:order).permit(attrs)
  end
end
