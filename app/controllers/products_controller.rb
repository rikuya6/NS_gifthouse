class ProductsController < ApplicationController

  def index
    one = Product.includes(:categories)
    if params[:keyword].present?
      keyword = params[:keyword]
      one = one.where('products.name like ?', '%' + keyword + '%')
    end
    @products = one.page(params[:page])
  end
end
