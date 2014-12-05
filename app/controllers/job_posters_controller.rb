class JobPostersController < ApplicationController
  before_action :set_job_poster, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @job_posters = JobPoster.all
    respond_with(@job_posters)
  end

  def show
    respond_with(@job_poster)
  end

  def new
    @job_poster = JobPoster.new
    respond_with(@job_poster)
  end

  def edit
  end

  def create
    @job_poster = JobPoster.new(job_poster_params)
    @job_poster.save
    redirect_to root_url
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
    def set_job_poster
      @job_poster = JobPoster.find(params[:id])
    end

    def job_poster_params
      params.require(:job_poster).permit(:Headline, :Details)
    end
end
