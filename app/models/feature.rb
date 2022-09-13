# frozen_string_literal: true

class Feature < ApplicationRecord
  #   validates :unit_price, :max_unit_limit, presence: true, numericality: true
  belongs_to :plan
  has_many :usages, dependent: :nullify
end
