class InvestesController < ApplicationController
  before_action :set_investe, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html

  def index
    @investes = Investe.all
    respond_with(@investes)
  end

  def show
    respond_with(@investe)
  end

  def new
    if current_user.admin? && user_signed_in?
      @investe = Investe.new
      respond_with(@investe)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Investe</b> at this time!</h2>", :status => '404', :layout => true  ## show message for unauthorised
    end
  end

  def edit
  end

  def create
    @investe = Investe.new(investe_params)
    if @investe.valid?
      @investe.save
      flash[:success] = "Investe created!"
      @investe.save
      redirect_to root_url
    else 
      flash[:error] = @investe.errors
      render :template => "investes/new"
    end
  end

  def update
    @investe.update(investe_params)
    respond_with(@investe)
  end

  def destroy
    @investe.destroy
    respond_with(@investe)
  end

  private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end

  private
    def set_investe
      @investe = Investe.find(params[:id])
    end

    def investe_params
      params.require(:investe).permit(:Company, :Opportunity_Headline, :Description)
    end
end
