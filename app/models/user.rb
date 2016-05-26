class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true

  def send_welcome_email
    StoreMailer.sample_email(self).deliver_now!
  end
end
