class User < ActiveRecord::Base
  has_many :carts
  has_many :orders, through: :carts

  has_secure_password
  validates :username, :email, presence: true

  def send_welcome_email
    StoreMailer.sample_email(self).deliver_now
  end

  def send_purchase_email
    StoreMailer.purchase_email(self).deliver_now
  end
end
