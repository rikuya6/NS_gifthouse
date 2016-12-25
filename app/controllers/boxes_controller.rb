class BoxesController < MemberController

  def new
    @likeed = cookies.signed[:check_products]
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

  def check_product
    if cookies.signed[:check_products].nil?
      cookies.signed[:check_products] = [params[:product_id]]
    else
      check_products = cookies.signed[:check_products]
      check_products << params[:product_id]
      cookies.signed[:check_products] = check_products
    end
    redirect_to products_path, notice: 'チェックしました！'
  end

  def uncheck_product
    check_products = cookies.signed[:check_products]
    check_products.delete(params[:product_id])
    cookies.signed[:check_products] = check_products
    redirect_to products_path, notice: 'チェックを外しました。'
  end

  private

  def box_params
    attrs = [:product_id, :wrapping_id, :dest, :zipcode, :payment]
    attrs << [:confirm]
    attrs << { product_attributes: [:id] }
    params.require(:order).permit(attrs)
  end
end
