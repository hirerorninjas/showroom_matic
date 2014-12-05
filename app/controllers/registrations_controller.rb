class RegistrationsController < Devise::RegistrationsController

  before_filter :authenticate_user!, :only => :token

  def new
      super
   end

  def create
    @user = User.new sign_up_params
      if Role.find(params[:user][:role_id].to_i).role == "Seeking Capital"
        redirect_to new_investe_path
      elsif Role.find(params[:user][:role_id].to_i).role == "Free Agent"    
        redirect_to new_free_agent_path
      elsif Role.find(params[:user][:role_id].to_i).role == "Job Posting"   
        redirect_to new_job_poster_path
      elsif Role.find(params[:user][:role_id].to_i).role == "Intern"   
        redirect_to new_intern_path
      else
        redirect_to new_investor_path
      end
        @user.save
        flash[:notice] = "You have signed up successfully."
    end

  def update
    super
  end 

  def destroy
    super
  end 

  def show 
    super
  end

private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_id)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :role_id)
  end
end
