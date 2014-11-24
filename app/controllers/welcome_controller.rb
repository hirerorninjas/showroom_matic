class WelcomeController < ApplicationController
  def index
  	@products = Product.all
  end
  
  def show_dealer
	@dealers = User.where(:admin => nil)
	#@dealers = User.where("admin = ? or dealer = ?", false, "dealer")
  end
end
