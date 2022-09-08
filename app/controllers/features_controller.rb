# frozen_string_literal: true

class FeaturesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @features = Feature.all
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.new(feature_params)
    if @feature.save!
      flash[:notice] = 'You have successfully added a feature.'
      redirect_to plan_path
    else
      render 'new'
    end
  end

  def new
    @plan = Plan.find(params[:plan_id])
    @feature = Feature.new
  end

  def edit
    @feature = Feature.find(params[:id])
  end

  def show
    @feature = Feature.find(params[:id])
  end

  def update
    @feature = Feature.find(params[:id])
    if @feature.update(feature_params)
      redirect_to @feature
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :unit_price, :max_unit_limit)
  end
end
