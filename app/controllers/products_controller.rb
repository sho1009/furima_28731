class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    tweet = Product.find(params[:id])
    tweet.destroy
  end

  def edit
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :explanation, :genre_id, :status_id, :burden_id, :area_id, :days_id, :value).merge(user_id: current_user.id)
  end
  
end

