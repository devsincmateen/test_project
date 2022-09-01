# frozen_string_literal: true

# Subscription model
class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user
end
