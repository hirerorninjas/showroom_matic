class FreeAgentsController < ApplicationController
  before_action :set_free_agent, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @free_agents = FreeAgent.all
    respond_with(@free_agents)
  end

  def show
    respond_with(@free_agent)
  end

  def new
    @free_agent = FreeAgent.new
    respond_with(@free_agent)
  end

  def edit
  end

  def create
    @free_agent = FreeAgent.new(free_agent_params)
    @free_agent.save
    redirect_to root_url
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
    def set_free_agent
      @free_agent = FreeAgent.find(params[:id])
    end

    def free_agent_params
      params.require(:free_agent).permit(:Headline, :Details)
    end
end
