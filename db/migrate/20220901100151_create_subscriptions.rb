# frozen_string_literal: true

# Create subscription migration
class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.float :amount
      t.timestamps
    end
  end
end
