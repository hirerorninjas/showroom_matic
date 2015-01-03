class RegistrationsController < Devise::RegistrationsController

  before_filter :authenticate_user!, :only => :token
  before_filter :configure_permitted_parameters, :only => [:create]

  def new
      super
   end

  def create
    build_resource(sign_up_params)
      if resource.save
        yield resource if block_given?
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
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
                #UserMailer.welcome_email(@user).deliver!
              end
      else #what code do I need here to preserve user entered field(s)?
        clean_up_passwords resource
        respond_with resource
      end
  end

  def update
    super
  end 

  def destroy
    @user = User.find(current_user).destroy
    DestroyUsermailer.destroy_email(@user).deliver!
    redirect_to root_url 
  end 

  def show 
    super
  end

  def index 
    @users = User.all
    redirect_to root_url  
  end



  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
    end

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_id, :resume, :terms_accepted, :country_id)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :role_id, :resume, :terms_accepted, :country_id)
    end
end




#if Role.find(params[:user][:role_id].to_i).role == "Seeking Capital"
    #     redirect_to new_investe_path
    #   elsif Role.find(params[:user][:role_id].to_i).role == "Free Agent"    
    #     redirect_to new_free_agent_path
    #   elsif Role.find(params[:user][:role_id].to_i).role == "Job Posting"   
    #     redirect_to new_job_poster_path
    #   elsif Role.find(params[:user][:role_id].to_i).role == "Intern"   
    #     redirect_to new_intern_path
    #   else
    #     redirect_to new_investor_path
    #   end
    #   @user.save
    #   #if Role.find(@user.role_id).role == "Investor" || Role.find(@user.role_id).role == "Seeking Capital"
    #   UserMailer.welcome_email(@user).deliver!
    #   # end
    #   #redirect_to root_url  
    # end