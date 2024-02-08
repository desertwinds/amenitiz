# frozen_string_literal: true

module Amenitiz
  # Rule for calculating final price when we want to apply a discount of buy 2 get 1 free.
  class TwoForOne < BaseRule
    def calculate(product_quantity)
      raise NotSupportedValue, 'Quantity needs to be >= 0' if product_quantity.negative?

      (product_quantity / 2 * base_price) + (product_quantity % 2 * base_price)
    end
  end
end
