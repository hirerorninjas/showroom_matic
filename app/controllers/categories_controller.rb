class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3) 
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    if current_user.admin? && user_signed_in?
      @category = Category.new
      respond_with(@category)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Category</b> at this time!</h2>", :status => '404', :layout => true
    end
  end

  def edit
  end

  def create
    if current_user.admin? && user_signed_in?
      @category = Category.new(category_params)
      @category.save
      respond_with(@category)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Categories</b> at this time!</h2>", :status => '404', :layout => true
      #redirect_to action: :index
    end
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end
    
  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
