class WelcomeController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dealers = User.all
  	  if params[:search]
        @products = Product.search(params[:search]).paginate(:per_page => 4, :page => params[:page])
      else 
        @products = Product.paginate(:per_page => 4, :page => params[:page])
        @like_ids = Like.all.collect(&:product_id)
        @product_ids = Product.all.collect(&:id)
        respond_with(@products)
      end
  end
  
  def show_dealer
	  @dealers = User.where(:admin => nil)
  end

  def show_account
    if user_signed_in? 
      @accounts = current_user
    end
  end

  def analytics
    @analytics = Product.all
    respond_with(@analytics)
  end

  def terms_candition
  end 
end
