require "rails_helper"

RSpec.describe StoreMailer do
  describe 'sample_email' do
    let(:user) { create :user }
    let(:mail) { described_class.sample_email(user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Thanks for signing up with E-Shoppe')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['tim@tim.com'])
    end

    it 'assigns @username' do
      expect(mail.body.encoded).to match(user.username)
    end
  end
  describe 'purchase_email' do
    let!(:user) { create :user }
    let!(:product) { create :product }
    let!(:cart) { user.carts.create(purchased: false)}
    let!(:order){ cart.orders.create(product_id: product.id, order_qty: 4)}
    let!(:mail) { described_class.purchase_email(user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Thanks for Your Order')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['tim@tim.com'])
    end

    it 'assigns @username' do
      expect(mail.body.encoded).to match(user.username)
    end

  end
end

