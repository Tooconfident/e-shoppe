require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe User, type: :mailer do
  subject { create :user }

  it 'sends an email' do
    expect { subject.send_sample_email }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
