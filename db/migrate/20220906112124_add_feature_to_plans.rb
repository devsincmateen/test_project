# frozen_string_literal: true

class AddFeatureToPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :plans, :feature, foreign_key: true
    add_column :plans, :foreign_key, :string
    add_column :plans, true, :string
  end
end
