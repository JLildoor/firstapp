require 'rails_helper'

describe Order do
  context "is placed" do
    product = FactoryBot.build(:product)
    user = FactoryBot.build(:user)

    it "is not valid without a user" do
      expect(Order.new(product: product)).not_to be_valid
    end

    it "is not valid without a product" do
      expect(Order.new(user: user)).not_to be_valid
    end
  end
end
