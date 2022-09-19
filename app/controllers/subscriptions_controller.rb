# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def new
    # byebug
    @plan = Plan.find(params[:format])
    set_subscription
  end

  def create
    set_subscription
    set_plan
    @subscription.plan_id = @plan.id

    @subscription.user_id = current_user.id
    if @subscription.save
      byebug
      flash[:success] = 'You have subscribed sucessfully'
      @plan.features.each do |f|
        usage = Usage.new(:subscription_id => @subscription.id, :feature_id => f.id, :units => 0)
        usage.save
      end
      redirect_to subscription_path(@subscription)
        
    else
      flash[:error] = 'Subscription Failed'
      redirect_to new_subscription_path(@plan)
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
    @plan = @subscription.plan
  end

  def mysubs
    @subscriptions = Subscription.includes(:plan).where(user_id: current_user.id)
  end

  private 

  def set_plan
    p = params[:subscription]
    @plan = Plan.find(p[:plan_id])
  end

  def set_subscription
    @subscription = Subscription.new
  end
end
