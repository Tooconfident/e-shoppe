# Preview all emails at http://localhost:3000/rails/mailers/store_mailer
class StoreMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    StoreMailer.sample_email(User.first)
  end
end
