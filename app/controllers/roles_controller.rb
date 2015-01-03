class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  respond_to :html

  def index
    @roles = Role.all
    respond_with(@roles)
  end

  def show
    respond_with(@role)
  end

  def new
    if current_user.admin? && user_signed_in?
      @role = Role.new
      respond_with(@role)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the <b>Role</b> at this time!</h2>", :status => '404', :layout => true
    end
  end

  def edit
  end

  def create
      @role = Role.new(role_params)
      @role.save
      respond_with(@role)
  end

  def update
    @role.update(role_params)
    respond_with(@role)
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:role)
    end
end
