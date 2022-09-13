# frozen_string_literal: true

class UsagesController < ApplicationController
  def create
    @usage = Usage.new(usage_params)
  end

  def index 
    @usages = Usage.where(subscription_id: params[:subscription_id])
    # byebug
  end
  private

  def usage_params
    params.require(:subscription).permit(:subscription_id, :feature_id, :units)
  end
end
