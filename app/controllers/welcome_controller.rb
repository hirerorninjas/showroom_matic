class WelcomeController < ApplicationController
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
  
  def show_dealer
	@dealers = User.where(:admin => nil)
	#@dealers = User.where("admin = ? or dealer = ?", false, "dealer")
  end
end
