class ProductsController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = current_owner.products.all
    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @category = current_owner.categories.find(params.expect(:category_id))
    @product = @category.products.build(product_params)
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if params.key?(:category_id)
      @category = current_owner.categories.find(params.expect(:category_id))
    end
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = current_owner.products.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.expect(product: [ :title, :description, :price, :category_id ])
  end
end
