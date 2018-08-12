class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :update, :edit, :destroy]
  def index
    @products = Product.all
    # @products = Product.includes(:category).where(published: true)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to products_url, notice: 'Created' if @product.save
      flash[:notice] = 'Not yet'
    render :new
  end

  def edit
    render :new
  end

  def update
    return redirect_to products_url, notice: 'Updated' if @product.update(product_params)
      flash[:notice] = "Not yet"
    render :new
  end

  def destroy
    return redirect_to products_url, notice: 'Deleted' if @product.destroy
  end

  private def product_params
    params.require(:product).permit( :title,
    :description, :level, :category_id, :price, :country, :published)
  end
  private def get_product
    @product = Product.find(params[:id])
  end
end
