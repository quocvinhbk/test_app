class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :publish]
  before_action :set_products, only: [:sort]
  helper_method :sort_column, :sort_direction

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    # @products = Product.order(params[:sort] + ' ' + params[:direction])
    @products = Product.search(params[:search]).order(sort_column + ' ' + sort_direction)
                       .paginate(per_page: 5, page: params[:page])
  end

  def publish
    # sleep 3
    @product.update(published: true, published_at: Time.zone.now) unless @product.published?
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

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

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
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

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_products
      @products = Product.where(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :category_id, :published)
    end
    
    def sort_column
      # params[:sort] || 'name'
      # Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
      %w[name price created_at category_id].include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      # params[:direction] || 'asc'
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
