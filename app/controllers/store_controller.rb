class StoreController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
