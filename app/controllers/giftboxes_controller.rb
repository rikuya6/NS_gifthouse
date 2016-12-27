class GiftboxesController < MemberController

  def new
    liked = cookies.signed[:check_products]
    unless liked.blank?
      @giftbox = Giftbox.new
      liked.each do |id|
        @giftbox.box_details.build(product_id: id)
      end
    else
      redirect_to products_path, notice: '詰め合わせ商品をお選びください'
    end
  end

  def create
    @giftbox = Giftbox.new(giftbox_params)
    if params[:back].present?
      render 'new'
    elsif @giftbox.save
      unlike_products(@giftbox.products.pluck(:id))
      @gift_product = create_gift_product
      @gift_product.save
      redirect_to new_orders_path(product_id: @product.id)
    else
      render 'new'
    end
  end

  def new_confirmation
    flash.now[:notice] = 'ボックスは商品の重さから最適なサイズが自動選択されました。'
    @giftbox = Giftbox.new(giftbox_params)
    @boxes = Box.all.pluck(:box_type, :id)
    @giftbox.box_id = 3
    render 'new' if @giftbox.invalid?
  end

  def check_product
    if cookies.signed[:check_products].nil?
      cookies.signed[:check_products] = [params[:product_id]]
    else
      check_products = cookies.signed[:check_products]
      check_products << params[:product_id]
      cookies.signed[:check_products] = check_products.uniq
    end
    redirect_to products_path, notice: '詰め合わせに追加しました'
  end

  def uncheck_product
    unlike_products([params[:product_id]])
    redirect_to products_path, notice: '詰め合わせから削除しました'
  end


  private

  def giftbox_params
    attrs = [:box_id]
    attrs << { box_details_attributes: [:id, :giftbox_id, :product_id, :_destroy,
      product_attributes: [:id ,:name]]}
    params.require(:giftbox).permit(attrs)
  end

  def create_gift_product
    @product = Product.new(stock: 1, note: 'ギフトボックス')
    producst_name = []
    @giftbox.products.each do |product|
      producst_name << product.name
    end
    @product.name = 'ギフト注文：' + producst_name.join(', ')
    box_price = Box.find(@giftbox.box_id).price
    product_sum_price = @giftbox.products.sum(:price)
    @product.price = box_price + product_sum_price
    @product.weight = @giftbox.products.sum(:weight)
    @product.categories << Category.where(name: 'ギフトボックス')
    @product
  end

  def unlike_products(product_id)
    check_products = cookies.signed[:check_products]
    product_id.each do |id|
      check_products.delete(id.to_s)
    end
    cookies.signed[:check_products] = check_products
  end
end
