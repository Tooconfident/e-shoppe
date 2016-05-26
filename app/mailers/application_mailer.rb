class ApplicationMailer < ActionMailer::Base
  default from: "tim@tim.com"
  def sample_email(user)
    @user = user
    mail(to:@user.email, subject: 'Thanks for signing up with E-Shoppe')
  end
end
