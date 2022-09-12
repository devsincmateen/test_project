# frozen_string_literal: true

class FeaturesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @features = Feature.all
  end

  def create
    set_plan
    @feature = @plan.features.new(feature_params)
    if @feature.save
      flash[:notice] = 'You have successfully added a feature.'
      redirect_to plan_path
    else

      flash[:notice] = 'Failed to add the feature.'
      render 'new'
    end
  end

  def edit
    set_plan
    @feature = Features.find(params[:id])
  end

  def show
    set_plan
    @feature = Features.find(params[:id])
  end

  def new
    set_plan
    if 
    @feature = @plan.features.build
  end

  def update
    set_feature
    if @feature.update(feature_params)
      flash[:success] = 'Feature Successfully Updated.'
      redirect_to @feature
    else
      flash[:error] = 'Feature Updation Failed.'
      redirect_to 'edit'
    end
  end

  def destroy
    set_feature
    @feature.destroy
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :unit_price, :max_unit_limit)
  end
end
