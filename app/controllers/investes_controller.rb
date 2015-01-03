class InvestesController < ApplicationController
  before_action :set_investe, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @investes = Investe.all
    respond_with(@investes)
  end

  def show
    respond_with(@investe)
  end

  def new
    @investe = Investe.new
    respond_with(@investe)
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
    def set_investe
      @investe = Investe.find(params[:id])
    end

    def investe_params
      params.require(:investe).permit(:Company, :Opportunity_Headline, :Description)
    end
end
