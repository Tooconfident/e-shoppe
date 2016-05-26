require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_no_name) {User.create(email: "ryan@mail.com", password: "1234")}
  let(:user_no_email) {User.create(username: "ryan", password: "1234")}
  let(:user_no_password) {User.create(email: "ryan@mail.com", username: "ryan")}

  describe "validations" do
    let(:real_user) {create :user}
    it "user can be made" do
      real_user
      expect(User.count).to eq(1)
    end


    context "will raise an error" do
      it "when the username field is empty" do
        user_no_name.save
        expect(user_no_name.errors[:username]).to include("can't be blank")
      end
      it "when the email field is empty" do
        user_no_email.save
        expect(user_no_email.errors[:email]).to include("can't be blank")
      end
      it "when the password field is empty" do
        user_no_password.save
        expect(user_no_password.errors[:password]).to include("can't be blank")
      end
    end
  end
end

RSpec.describe User, type: :mailer do
  subject { create :user }

  it 'sends an email' do
    expect { subject.send_welcome_email }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
