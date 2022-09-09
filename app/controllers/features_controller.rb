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

      flash[:notice] = 'Failed to add the feature.'
      render 'new'
    end
  end

  def edit
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.find(params[:id])
  end

  def show
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.find(params[:id])
  end

  def new
    
    @plan = Plan.find(params[:plan_id])
    
    @feature = @plan.features.build
  end

  def update
    @feature = find_id
    if @feature.update(feature_params)
      flash[:notice] = 'Feature Successfully Updated.'
      redirect_to @feature
    else
      flash[:notice] = 'Feature Updation Failed.'
      redirect_to 'edit'
    end
  end

  def destroy
    @feature = find_id
    @feature.destroy
  end

  private

  def find_id
    Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :unit_price, :max_unit_limit)
  end
end
