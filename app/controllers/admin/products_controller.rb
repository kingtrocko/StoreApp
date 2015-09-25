class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:provider_id]
      @products = Product.where(provider_id: params[:provider_id])
    else
      @products = Product.all
    end
    
    if params.has_key?(:search)
        @products = Product.search_by_category(params[:search])
        if !@products
            @products = Product.all
        end
    end
  end
  

  # GET /products/1
  # GET /products/1.json
  def show
  end
  
  # GET /products/new
  def new
    @product = Product.new
    @nodes = Category.roots
    @product_unit = @product.product_units.build
    #@selected_categories = Category.all
    #@unit_options = Unit.all.map{|u| [ u.title, u.id ] }
  end

  # GET /products/1/edit
  def edit
      #p = ProductUnit.select("unit_id, price,description").where("product_id = '%#{params[:id]}%'")

    #Rails.logger.debug("RESULT: #{p}")
    @nodes = Category.roots
    @product_unit = @product.product_units.build
    #@product_unit = @product.product_units.build(:unit_id => 2, :price => 38.5, :description => "just desc")
    
    #Rails.logger.debug("params in UPDATE: #{params}")
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to action: :index, notice: 'Product was successfully created.' }
        #format.html { redirect_to [:admin, @product], notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        Rails.logger.debug("ERROR : #{@product.errors.full_messages}")
        @product_unit = @product.product_units.new
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        @product_unit = @product.product_units.build
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def children
    @product = Product.new
    @nodes = Category.find(params[:id].to_i).children
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit( :image, :title, :description, { :category_ids => [] }, :provider_id, :active, product_units_attributes: [:product_id, :unit_id, :price, :description])
    end
end
