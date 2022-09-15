# frozen_string_literal: true

class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.2]
  def self.up
    change_table :plans do |t|
      t.change :monthly_income, :float
    end
  end
end
