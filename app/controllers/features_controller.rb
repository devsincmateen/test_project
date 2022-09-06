# frozen_string_literal: true

class FeaturesController < ApplicationController
  def index
    @features = Feature.all
  end

  def create
    @feature = Feature.new(feature_params)
    p @features
    if @feature.save
      redirect_to @feature
    else
      render 'new'
    end
  end

  def new
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

  def destroy; end

  private

  def feature_params
    params.require(:feature).permit(:name, :code, :monthly_income)
  end
end
