# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates :amount, presence: true, numericality: true
  belongs_to :user
  belongs_to :plan
end
