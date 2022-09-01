# frozen_string_literal: true

# create plan class
class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :code
      t.string :name
      t.float :monthly_income
      t.float :unit_price
      t.float :max_unit_limit

      t.timestamps
    end
  end
end
