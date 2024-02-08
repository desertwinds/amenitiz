# frozen_string_literal: true

module Amenitiz
  # Rule for calculating final price when we want to change the base price after having
  # a certain threshold of items.
  class BulkWithNewPrice < BaseRule
    attr_accessor :new_price, :threshold

    def initialize(base_price:, new_price:, threshold:)
      super(base_price: base_price)

      @new_price = new_price
      @threshold = threshold
    end

    def calculate(product_quantity)
      raise NotSupportedValue, 'Quantity needs to be >= 0' if product_quantity.negative?

      return product_quantity * new_price if product_quantity >= threshold

      product_quantity * base_price
    end
  end
end
