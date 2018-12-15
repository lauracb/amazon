class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :active)
    end

end
