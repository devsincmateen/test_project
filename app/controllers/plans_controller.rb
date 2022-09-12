# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = 'Plan Successfully Created.'
      redirect_to @plan
    else
      flash[:error] = 'Failed to create Plan.'
      render 'new'
    end
  end

  def new
    @plan = Plan.new
  end

  def edit
    set_plan
  end

  def show
    set_plan
  end

  def update
    set_plan
    if @plan.update(plan_params)
      flash[:success] = 'Plan successfully updated.'
      redirect_to @plan
    else
      flash[:error] = 'Failed to update Plan.'
      redirect_to 'edit'
    end
  end

  def destroy
    Plan.destroy(params[:id])
  end

  def myplans
    @subscriptions = Subscription.includes(:plan).where(user_id: current_user.id)
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :code, :monthly_income)
  end
end
