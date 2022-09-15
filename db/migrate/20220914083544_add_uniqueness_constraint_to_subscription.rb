class AddUniquenessConstraintToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_index :subscriptions, [:plan_id, :user_id], unique: true
    add_index :usages, [:feature_id, :subscription_id], unique: true
    add_index :plans, [:name], unique: true
    add_index :plans, [:code], unique: true
  end
end
