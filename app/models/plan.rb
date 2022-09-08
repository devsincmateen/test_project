# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :features, dependent: :destroy
  has_many :subscriptions
end
