# frozen_string_literal: true

# adding plan reference to feature
class AddPlanToFeatures < ActiveRecord::Migration[5.2]
  def change
    add_reference :features, :plan, foreign_key: true
  end
end
