class Admin::ProductsController < Admin::Base

  def index
    @products = Product.paginate(page: params[:page], per_page: 15)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)
    if @product.save
      redirect_to admin_products_path, notice: '商品を更新しました。'
    else
      render 'edit'
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :weight, :stock, :note)
  end
end
