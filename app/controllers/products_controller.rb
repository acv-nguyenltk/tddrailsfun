class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit( :title,
      :description, :level, :category_id, :price, :country, :published)
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Created"
      redirect_to products_url
      else
        flash[:notice] = "Not yet"
      render :new
      end
  end
end
