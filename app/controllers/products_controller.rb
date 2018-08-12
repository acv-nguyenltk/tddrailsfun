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
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Created"
      redirect_to products_url
      else
        flash[:notice] = "Not yet"
      render :new
      end
  end

  def edit
    @product = Product.find(params[:id])
    render :new
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Updated"
    redirect_to products_url
    else
      flash[:notice] = "Not yet"
    render :new
    end
  end

  private def product_params
    params.require(:product).permit( :title,
    :description, :level, :category_id, :price, :country, :published)
  end
end
