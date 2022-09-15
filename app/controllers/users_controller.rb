# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
  end
end
