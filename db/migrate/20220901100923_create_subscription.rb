class CreateSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.float :amount
      
      t.timestamps
    end
  end
end
