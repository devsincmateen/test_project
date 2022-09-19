# frozen_string_literal: true

class UsagesController < ApplicationController
  def create
    @usage = Usage.new(usage_params)
  end

  def index 
    @subscription = Subscription.find(params[:subscription_id])
    @usages = @subscription.usages
    # byebug
  end

  def update
    @usage = Usage.find(params[:id])
    @usage.units += get_units
    @usage.save
  end
  def show 
    @usages = Usage.where(subscription_id: params[:subscription_id])
    # byebug
  end

  private
  def get_units
    params[:usage][:units].to_f
  end
  def usage_params
    params.require(:subscription).permit(:subscription_id, :feature_id, :units)
  end
end
