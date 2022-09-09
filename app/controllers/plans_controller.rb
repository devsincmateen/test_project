# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def create
    @plan = Plan.new(plan_params)
    Rails.logger.debug @plans
    if @plan.save
      flash[:notice] = 'Plan Successfully Created.'
      redirect_to @plan
    else
      flash[:notice] = 'Failed to create Plan.'
      render 'new'
    end
  end

  def new
    @plan = Plan.new
  end

  def edit
    @plan = find_id
  end

  def show
    @plan = find_id
  end

  def update
    @plan = find_id
    if @plan.update(plan_params)
      flash[:notice] = 'Plan successfully updated.'
      redirect_to @plan
    else
      flash[:notice] = 'Failed to update Plan.'
      redirect_to 'edit'
    end
  end

  def destroy
    @plan = find_id
    @plan.destroy
  end

  private

  def find_id
    Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :code, :monthly_income)
  end
end
