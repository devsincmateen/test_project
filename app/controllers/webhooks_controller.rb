class WebhooksController < ApplicationController
  
    def create
      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil
  
      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, Rails.application.credentials[:stripe][:webhook]
        )
      rescue JSON::ParserError => e
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts "Signature error"
        p e
        return
      end
  
      # Handle the event
      case event.type
      when 'checkout.session.completed'
        session = event.data.object
        @subscription = Subscription.new
        @subscription.plan_id = @plan.id

        @subscription.user_id = current_user.id
        if @subscription.save
          byebug
          flash[:success] = 'You have subscribed sucessfully'
          @plan.features.each do |f|
            usage = Usage.new(:subscription_id => @subscription.id, :feature_id => f.id, :units => 0)
            byebug
            usage.save
          end
          redirect_to subscription_path(@subscription)
            
        else
          flash[:error] = 'Subscription Failed'
          redirect_to new_subscription_path(@plan)
        end
      
      when 'product.created'
        session = event.data.object
        @plan = Plan.find_by(name: session.name)
      end
  
      render json: { message: 'success' }
    end
  end