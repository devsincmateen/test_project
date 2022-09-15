class CheckoutController < ApplicationController
    def create
        # byebug
        plan = Plan.find(params[:plan_id])

        price = Stripe::Price.create({
            unit_amount: (plan.monthly_income*100).to_i,
            currency: 'usd',
            product_data: { name: plan.name}
        })

        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                price: price.id,
                quantity: '1'

            }],
            mode: 'payment',
            success_url: http.post('/subscriptions/action?'),
            cancel_url: root_url,
          })
            # byebug
          respond_to do |format|
            format.js
          end
    end
end
