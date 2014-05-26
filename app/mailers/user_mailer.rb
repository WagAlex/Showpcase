class UserMailer < ActionMailer::Base
  default from: 'contact@showpcase.com'

  def welcome_email(user)
    @user = user
    @url = 'http://showpcase.com/login'
  end

  def goodbye_email(user)
  end

end