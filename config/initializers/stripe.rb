if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_GnxJDGnk5fPJEtQLzD3pXn0F00v5Pm51m7',
    secret_key: 'sk_test_yWo1DPwRyMbEtcbP9mwAIs4P00aXGgq1SL'
  }
end
