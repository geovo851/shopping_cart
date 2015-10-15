class StoreController < ApplicationController
  include CurrentCart
  filter_access_to :all
  before_action :set_cart

  def index
    @products = Product.page(params[:page]).per(5)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def product
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

  def cart
    @cart = Cart.find(params[:id])
  end

  def delivery
    @categories = Category.all
  end

  def about
    @categories = Category.all
  end

  def contact
    @categories = Category.all
  end
end
