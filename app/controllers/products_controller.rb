class ProductsController < ApplicationController

  def index
    one = Product.includes(:categories).page(params[:page])
    if params[:keyword].present?
      keyword = params[:keyword]
      one = one.where('name like ?', '%'+ keyword + '%')
    end
    @products = one
  end
end
