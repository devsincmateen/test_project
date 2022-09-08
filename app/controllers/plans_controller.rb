# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def create
    @plan = Plan.new(plan_params)
    p @plans
    if @plan.save
      redirect_to @plan
    else
      render 'new'
    end
  end

  def new
    @plan = Plan.new
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to @plan
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :code, :monthly_income)
  end
end
