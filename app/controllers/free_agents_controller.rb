class FreeAgentsController < ApplicationController
  before_action :set_free_agent, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html

  def index
    @free_agents = FreeAgent.all
    respond_with(@free_agents)
  end

  def show
    respond_with(@free_agent)
  end

  def new
    if current_user.admin? && user_signed_in?
      @free_agent = FreeAgent.new
      respond_with(@free_agent)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>FreeAgent</b> at this time!</h2>", :status => '404', :layout => true  ## show message for unauthorised
    end
  end

  def edit
  end

  def create
    @free_agent = FreeAgent.new(free_agent_params)
    if @free_agent.valid?
      @free_agent.save
      flash[:success] = "Intern created!"
      redirect_to root_url
    else 
      flash[:error] = @free_agent.errors
      render :template => "free_agents/new"
    end
  end

  def update
    @free_agent.update(free_agent_params)
    respond_with(@free_agent)
  end

  def destroy
    @free_agent.destroy
    respond_with(@free_agent)
  end

  private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end
    
  private
    def set_free_agent
      @free_agent = FreeAgent.find(params[:id])
    end

    def free_agent_params
      params.require(:free_agent).permit(:Headline, :Details)
    end
end
