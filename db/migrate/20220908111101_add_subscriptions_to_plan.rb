# frozen_string_literal: true

class AddSubscriptionsToPlan < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :plan, foreign_key: true
    add_reference :subscriptions, :user, foreign_key: true
  end
end
