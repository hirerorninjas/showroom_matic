class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:search]
      @products = Product.search(params[:search]).paginate(:per_page => 4, :page => params[:page])
    else 
      @products = Product.paginate(page: params[:page], per_page: 3) 
      @like_ids = Like.all.collect(&:product_id)
      @product_ids = Product.all.collect(&:id)
      respond_with(@products)
    end
  end


  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    if current_user.admin? && user_signed_in?
      @product = current_user.products.build(product_params)
      @product.save
      respond_with(@product)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Product</b> at this time!</h2>", :status => '404', :layout => true
      #redirect_to action: :index
    end
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

def block_deal
    @block_deal = Product.find(params[:id])
    @block_deal.update_attributes(:deal => 'false')
    respond_with(@block_deal)
  end

  def all_likes
    @deal = Product.find(params[:id])
    if !Like.exists?(product_id: params[:id])
     @test = Like.create(:user_id => current_user.id, :product_id => params[:id])
    respond_with(@test)
    end
  end

  def unlike_likes
    @deal = Product.find(params[:id])
     @destroy_like = Like.where(:product_id => params[:id].to_i).destroy_all
    respond_with(@destroy_like)
 end

  def autocomplete
  @products = Product.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  @hash = []
  @products.each do |pro|
    @hash << {"label" => pro.name, "id" => pro.id}
  end
  render :json => @hash
  end

  private
    def set_product
      @product = Product.find_by_name(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :category_id, :user_id, :price, :quantity, :deal, :category_name, :photo)
    end
end
