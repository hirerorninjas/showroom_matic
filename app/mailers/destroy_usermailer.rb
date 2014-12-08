class DestroyUsermailer < ActionMailer::Base
  default from: 'notifications@example.com'
  def destroy_email(user)
    @user = user
    @url = 'http://mysterious-wildwood-8925.herokuapp.com/'
    mail(to: @user.email, subject: 'user is Deleted')
  end
end
