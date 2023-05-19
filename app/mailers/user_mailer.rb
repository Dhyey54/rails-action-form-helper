class UserMailer < ApplicationMailer
  default from: "dhyeysapara5422@gmail.com"

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def update_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Email Updated Successfully.')
  end
end
