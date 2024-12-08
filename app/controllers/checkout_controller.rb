class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: [ "card" ],
      line_items: [ {
        price_data: {
          currency: "usd",
          product_data: {
            name: product.name
          },
        unit_amount: (product.price * 100).to_i
      },
      quantity: 1
    } ],
      mode: "payment",
      success_url: root_url,
      cancel_url: root_url
    })

    respond_to do |format|
      format.js
      format.html { redirect_to @session.url, allow_other_host: true }
      format.turbo_stream { render turbo_stream: turbo_stream.replace("checkout", partial: "checkout/redirect", locals: { url: @session.url }) }
    end
  end
end
