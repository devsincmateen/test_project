# frozen_string_literal: true

class Plan < ApplicationRecord
  # validates :monthly_income, presence: true, numericality: true
  # validates :name, presence: true, format: { with: /^[a-z]+$/i }
  has_many :features, dependent: :destroy
  has_many :subscriptions, dependent: :nullify
end
