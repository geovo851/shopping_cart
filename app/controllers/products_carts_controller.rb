class ProductsCartsController < ApplicationController
  include CurrentCart
  filter_access_to :all
  before_action :set_cart

  def create
    products_cart = @cart.products_carts.find_by(product_id: params[:product_id])
    if products_cart
      products_cart.quantity += 1
    else
      products_cart = @cart.products_carts.build(product_id: params[:product_id],
                                   quantity: 1, price: params[:price])
    end

    if products_cart.save
      calculate_discounts

      @cart.save
      redirect_to store_cart_path(products_cart.cart_id)
    else
      flash[:error] = "Could not add to cart."
      render :back
    end
  end

  def update_quantity
    products_cart = ProductsCart.find_by(id: params[:id])
    products_cart.quantity = params[:quantity].to_f
    products_cart.save

    calculate_discounts
    @cart.save

    render json: { total_sum:  @cart.total_sum.round(2),
                   discount: @cart.discount.round(2) }
  end

  def destroy
    @products_cart = @cart.products_carts.find(params[:id])
    @products_cart.destroy

    calculate_discounts
    @cart.save

    redirect_to store_cart_path(@cart.id)
  end

  private

    def calculate_discounts
      discount_percentage = 0
      discount_sum        = 0
      total_sum = 0

      joins  = "LEFT JOIN discounts_products ON discounts_products.product_id = products_carts.product_id AND discounts_products.quantity <= products_carts.quantity AND discounts_products.actual = 'true'"
      select = 'products_carts.price * products_carts.quantity AS sum, discounts_products.value AS value, discounts_products.type_discount AS type_discount'
      products_carts = @cart.products_carts.joins(joins).select(select)

      products_carts.each do |discount_product|
        if discount_product.type_discount == 'Percentage of total'
          discount_percentage += discount_product.value
        elsif discount_product.type_discount == 'Fixed sum'
          discount_sum += discount_product.value
        end
        total_sum += discount_product.sum
      end

      joins  = "INNER JOIN products ON products.id = products_carts.product_id INNER JOIN discounts_categories ON discounts_categories.category_id = products.category_id AND discounts_categories.actual = 'true'"
      select = 'max(discounts_categories.value) AS value, sum(products_carts.quantity) AS quantity, max(discounts_categories.type_discount) AS type_discount, discounts_categories.id AS discounts_categories_id, max(discounts_categories.quantity) AS discounts_categories_quantity'
      discounts_categories = @cart.products_carts.joins(joins).select(select).group("discounts_categories_id").having("max(discounts_categories.quantity) <= sum(products_carts.quantity)")

      discounts_categories.each do |discount_category|
        if discount_category.type_discount == 'Percentage of total'
          discount_percentage += discount_category.value
        elsif discount_category.type_discount == 'Fixed sum'
          discount_sum += discount_category.value
        end
      end

      if discount_percentage > 0
        discount_sum += discount_percentage * total_sum / 100
      end

      if discount_sum > 0
        if discount_sum >= total_sum
          @cart.discount = total_sum
          @cart.total_sum = 0
        else
          @cart.discount = discount_sum
          @cart.total_sum = total_sum - discount_sum
        end
      else
        @cart.discount = 0
        @cart.total_sum = total_sum
      end
    end
end
