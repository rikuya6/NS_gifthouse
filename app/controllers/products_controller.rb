class ProductsController < GuestController

  def index
    one = Product.includes(:categories)
    if params[:keyword].present?
      keyword = params[:keyword]
      one = one.where('products.name like ?', '%' + keyword + '%')
    end
    @products = one.page(params[:page]).per(16)
  end

  def show
    @product = Product.find(params[:id])
  end
end
