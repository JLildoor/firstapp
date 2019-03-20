require 'rails_helper'

describe Comment do
  let(:product) { Product.create!(name: "Big stand") }
  comment = FactoryBot.build(:comment)

  it "is not valid without a rating" do
    comment.rating = nil
    expect(comment).not_to be_valid
  end

  it "is not valid without a body" do
    comment.body = nil
    expect(comment).not_to be_valid
  end
end
