class SalesmenController < ApplicationController
  before_action :set_salesman, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html

  def index
    @salesmen = Salesman.all
    respond_with(@salesmen)
  end

  def show
    respond_with(@salesman)
  end

  def new
    if current_user.admin? && user_signed_in?
      @salesman = Salesman.new
      respond_with(@salesman)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Salesman</b> at this time!</h2>", :status => '404', :layout => true ## show message for unauthorised
    end
  end

  def edit
  end

  def create
    @salesman = Salesman.new(salesman_params)
    @salesman.save
    respond_with(@salesman)
  end

  def update
    @salesman.update(salesman_params)
    respond_with(@salesman)
  end

  def destroy
    @salesman.destroy
    respond_with(@salesman)
  end

  private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end

  private
    def set_salesman
      @salesman = Salesman.find(params[:id])
    end

    def salesman_params
      params.require(:salesman).permit(:name, :address, :user_id)
    end
end
