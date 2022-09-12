# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def new
    set_plan
    set_subscription
  end

  def create
    set_plan
    @subscription = @plan.subscriptions.new
    @subscription.user_id = current_user.id
    if @subscription.save
      flash[:success] = 'You have subscribed sucessfully'
      redirect_to plan_subscription_path(@plan, @subscription)
    else
      flash[:error] = 'Subscription Failed'
      redirect_to new_subscription_path(@plan, @subscription)
    end
  end

  def show
    set_plan
    @subscription = Subscription.find(params[:id])
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_subscription
    @subscription = @plan.subscriptions.new
  end
end
