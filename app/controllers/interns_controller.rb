class InternsController < ApplicationController
  before_action :set_intern, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html

  def index
    @interns = Intern.all
    respond_with(@interns)
  end

  def show
    respond_with(@intern)
  end

  def new
    if current_user.admin? && user_signed_in?
      @intern = Intern.new
      respond_with(@intern)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Intern</b> at this time!</h2>", :status => '404', :layout => true
    end
  end

  def edit
  end

  def create
    @intern = Intern.new(intern_params)
    if @intern.valid?
      @intern.save
      flash[:success] = "Intern created!"
      redirect_to root_path
    else
      flash[:error] = @intern.errors
      render :template => "interns/new"
    end
end

  def update
    @intern.update(intern_params)
    respond_with(@intern)
  end

  def destroy
    @intern.destroy
    respond_with(@intern)
  end

private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end
    
  private
    def set_intern
      @intern = Intern.find(params[:id])
    end

    def intern_params
      params.require(:intern).permit(:Headline, :Details)
    end
end
