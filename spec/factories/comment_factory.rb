FactoryBot.define do
  factory :comment do
    user_id { "user.id" }
    product_id { "product.id" }
    body { "body" }
  end
end
