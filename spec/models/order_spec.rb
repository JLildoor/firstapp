require 'rails_helper'

describe Order do
  context "is placed" do
    let(:product) { Product.create!(name: "Huge stand") }
    let(:user) { User.create!(email: "lildoor@me.com", password: "password") }

    it "is not valid without a user" do
      expect(Order.new(product: product)).not_to be_valid
    end

    it "is not valid without a product" do
      expect(Order.new(user: user)).not_to be_valid
    end
  end
end
