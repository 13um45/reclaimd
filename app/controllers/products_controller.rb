class ProductsController < ApplicationController
 before_action :require_logged_in, only: [:new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_admin.products.new
  end

  def edit
    if current_admin
      @product = current_admin.products.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def create
    @product = current_admin.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
     respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 private

  def product_params
    params.require(:product).permit(:name, :tops, :bottoms, :outerwear, :shoes, :bags, :jewelry,
      :mens, :womens, :unisex, :xs, :s, :m, :l, :xl, :obsidian, :onyx, :alabaster, :slate, :heather,
      :silver, :pattern, :quantity, :price, :brand, :material, :description, :admin_id)
  end
end

