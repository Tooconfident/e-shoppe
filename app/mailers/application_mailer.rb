class ApplicationMailer < ActionMailer::Base
  default from: "tim@tim.com"

  def sample_email(user)
    @user = user
    mail(to:@user.email, subject: 'Thanks for signing up with E-Shoppe')
  end

  def purchase_email(user)
    @user = user
    @cart = @user.carts.find_by(purchased: false)
    mail(to:@user.email, subject: 'Thanks for Your Order')
  end
end
