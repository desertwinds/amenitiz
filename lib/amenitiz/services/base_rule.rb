# frozen_string_literal: true

module Amenitiz
  # Base class that will serve as an interface for all of the expected pricing
  # rules.
  class BaseRule
    attr_accessor :base_price

    def initialize(base_price:)
      @base_price = base_price
    end

    def calculate(_product_quantity)
      raise MissingDefinition, 'Please define your rule calculation.'
    end
  end
end
