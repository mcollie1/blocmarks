class UserMailer < ActionMailer::Base
  default from: 'postmaster@app23725926.mailgun.org'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://collier-blockmarks.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
