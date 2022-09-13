# frozen_string_literal: true

class AddFeatureToUsages < ActiveRecord::Migration[5.2]
  def change
    add_reference :usages, :feature, foreign_key: true
    add_reference :usages, :subscription, foreign_key: true
  end
end
