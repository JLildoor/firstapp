require 'rails_helper'

describe User do
  context "email and password required" do
    let(:user) { User.create!(password: "password", email: "email@email.com") }

    it "is a valid email" do
      expect(user.email).to eq "email@email.com"
    end

    it "is a valid password" do
      expect(user.password).to eq "password"
    end

    it "is not valid without an email" do
      user.email = nil
      expect(user).not_to be_valid
    end
  end
end
