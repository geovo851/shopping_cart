class StoreController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(5)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def search_products
    @products = Product.where(category_id: params[:id]).page(params[:page]).per(5)

    @categories = Category.all
    @category_id = "category_#{params[:id]}"

    respond_to do |format|
      format.html
      format.js {}
    end
  end
end
