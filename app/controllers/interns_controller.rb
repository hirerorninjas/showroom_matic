class InternsController < ApplicationController
  before_action :set_intern, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @interns = Intern.all
    respond_with(@interns)
  end

  def show
    respond_with(@intern)
  end

  def new
    @intern = Intern.new
    respond_with(@intern)
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
    def set_intern
      @intern = Intern.find(params[:id])
    end

    def intern_params
      params.require(:intern).permit(:Headline, :Details)
    end
end
