class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html
  def index
    @investors = Investor.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @investors}
      format.json { render json: @investors}
    end
  end

  def show
    respond_with(@investor)
  end

  def new
    if current_user.admin? && user_signed_in?
      @investor = Investor.new
      respond_with(@investor)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Investor</b> at this time!</h2>", :status => '404', :layout => true
    end
  end

  def edit
  end

  def create
    @investor = Investor.new(investor_params)
      if @investor.valid?
         @investor.save
         flash[:success] = "Investor created!"
         redirect_to root_url
      else 
         flash[:error] = @investor.errors
         render :template => "investors/new"
      end
  end

  def update
    @investor.update(investor_params)
    respond_with(@investor)
  end

  def destroy
    @investor.destroy
    respond_with(@investor)
  end

  private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end

  private
    def set_investor
      @investor = Investor.find(params[:id])
    end

    def investor_params
      params.require(:investor).permit(:Company, :Equity_Investment, :Revenue, :EBITDA)
    end
end
