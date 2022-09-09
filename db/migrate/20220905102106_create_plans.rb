# frozen_string_literal: true

# creating plan table
class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :code
      t.integer :monthly_income

      t.timestamps
    end
  end
end
