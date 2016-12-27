class GiftboxesController < MemberController

  def new
    @liked = cookies.signed[:check_products]
    @giftbox = Giftbox.new
    @products = Product.where(id: @liked)
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
    redirect_to products_path, notice: '詰め合わせに追加しました'
  end

  def uncheck_product
    check_products = cookies.signed[:check_products]
    check_products.delete(params[:product_id])
    cookies.signed[:check_products] = check_products
    redirect_to products_path, notice: '詰め合わせから削除しました'
  end

  private

  def box_params
    attrs = [:box_id]
    attrs << [:confirm]
    attrs << { product_attributes: [:id] }
    params.require(:giftbox).permit(attrs)
  end
end
