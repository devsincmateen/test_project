# frozen_string_literal: true

# Feature to plan reference
class AddFeatureToPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :features, :plan, foreign_key: true
  end
end
