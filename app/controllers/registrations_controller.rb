class RegistrationsController < Devise::RegistrationsController

  before_filter :authenticate_user!, :only => :token

  def new
      super
   end

 
  def create
    @user = User.new sign_up_params
    if @user.save
      flash[:notice] = "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."
      redirect_to root_url
    else
      render :action => :new
    end
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
