# frozen_string_literal: true

class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.float :unit_price
      t.integer :max_unit_limit
      t.references :
      t.timestamps
    end
  end
end
