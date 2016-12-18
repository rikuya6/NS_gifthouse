class Admin::ProductsController < Admin::Base

  def index
    @products = Product.includes(:categories).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    return send_image if params[:format].in?(['jpg', 'png', 'gif'])
    render 'show'
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if params[:back].present?
      render 'new'
    elsif @product.save
      redirect_to [:admin, @product], notice: '商品を新規登録しました。'
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
    if params[:back].present?
      render 'edit'
    elsif @product.save
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

  def new_confirmation
    @product = Product.new(product_params)
    render 'new' if @product.invalid?
  end

  def edit_confirmation
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)
    render 'edit' if @product.invalid?
  end


  private

  def send_image
    if @product.image.present?
      send_data @product.image,
        type: @product.content_type, disposition: 'inline'
    else
      raise NotFound
    end
  end

  def product_params
    attrs = [:name, :price, :weight, :stock, :note]
    attrs << [:confirm]
    attrs << { categories_attributes: [:id, :name] }
    attrs << { category_ids: [] }
    params.require(:product).permit(attrs)
  end
end
