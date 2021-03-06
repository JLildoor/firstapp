class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @user = current_user

    Stripe.api_key = 'sk_test_yWo1DPwRyMbEtcbP9mwAIs4P00aXGgq1SL'

    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's credit card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i, # amount in cents, again
        currency: "usd",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email,
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
      flash[:success] = "Your payment was processed successfully"
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there has been as error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end
end
