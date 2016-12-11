class Admin::ProductsController < Admin::Base

  def index
    @products = Product.includes(:categories).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to [:admin, @product]
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

    # @cateory = Category.find(params[:id])
    # @product.product_categories << @category

    if @product.save
      redirect_to [:admin, @product], notice: '商品を更新しました。'
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: '商品を削除しました。'
  end


  private

  def product_params
    attrs = [:name, :price, :weight, :stock, :note]
    attrs << { categories_attributes: [:id, :name] }
    attrs << { category_ids: [] }
    params.require(:product).permit(attrs)
  end
end
