class DiscountsProductsController < ApplicationController
  filter_resource_access

  def index
    @discounts_products = DiscountsProduct.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @discounts_product = DiscountsProduct.find(params[:id])
  end

  def new
    @discounts_product = DiscountsProduct.new
    @products = Product.all
  end

  def edit
    @discounts_product = DiscountsProduct.find(params[:id])
    @products = Product.all
  end

  def create
    @discounts_product = DiscountsProduct.new(discounts_product_params)
   
    if @discounts_product.save
      redirect_to discounts_products_path
    else
      @products = Product.all
      render 'new'
    end
  end

  def update
    @discounts_product = DiscountsProduct.find(params[:id])
   
    if @discounts_product.update(discounts_product_params)
      redirect_to discounts_products_path
    else
      @products = Product.all
      render 'edit'
    end
  end
  
  def destroy
    @discounts_product = DiscountsProduct.find(params[:id])
    @discounts_product.destroy
 
    redirect_to discounts_products_path
  end

  private
    def discounts_product_params
      params.require(:discounts_product).permit(:product_id, :quantity,
                                                 :value, :type_discount, :actual)
    end
end
