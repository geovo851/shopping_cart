class DiscountsCategoriesController < ApplicationController
  filter_resource_access

  def index
    @discounts_categories = DiscountsCategory.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @discounts_category = DiscountsCategory.find(params[:id])
  end

  def new
    @discounts_category = DiscountsCategory.new
    @categories = Category.all
  end

  def edit
    @discounts_category = DiscountsCategory.find(params[:id])
    @categories = Category.all
  end

  def create
    @discounts_category = DiscountsCategory.new(discounts_category_params)
   
    if @discounts_category.save
      redirect_to discounts_categories_path
    else
      @categories = Category.all
      render 'new'
    end
  end

  def update
    @discounts_category = DiscountsCategory.find(params[:id])
   
    if @discounts_category.update(discounts_category_params)
      redirect_to discounts_categories_path
    else
      @categories = Category.all
      render 'edit'
    end
  end
  
  def destroy
    @discounts_category = DiscountsCategory.find(params[:id])
    @discounts_category.destroy
 
    redirect_to discounts_categories_path
  end

  private
    def discounts_category_params
      params.require(:discounts_category).permit(:category_id, :quantity,
                                                 :value, :type_discount, :actual)
    end
end
