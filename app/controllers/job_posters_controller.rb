class JobPostersController < ApplicationController
  before_action :set_job_poster, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html

  def index
    @job_posters = JobPoster.all
    respond_with(@job_posters)
  end

  def show
    respond_with(@job_poster)
  end

  def new
    if current_user.admin? && user_signed_in?
      @job_poster = JobPoster.new
      respond_with(@job_poster)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>JobPoster</b> at this time!</h2>", :status => '404', :layout => true
    end
  end

  def edit
  end

  def create
    @job_poster = JobPoster.new(job_poster_params)
    if @job_poster.valid?
      @job_poster.save
      flash[:success] = "JobPoster created!"
      redirect_to root_url
    else 
      flash[:error] = @job_poster.errors
      render :template => "job_posters/new"
    end
  end

  def update
    @job_poster.update(job_poster_params)
    respond_with(@job_poster)
  end

  def destroy
    @job_poster.destroy
    respond_with(@job_poster)
  end

  private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end


  private
    def set_job_poster
      @job_poster = JobPoster.find(params[:id])
    end

    def job_poster_params
      params.require(:job_poster).permit(:Headline, :Details)
    end
end
