module Amenitiz
  class TwoForOne < BaseRule
    def calculate(product_quantity)
      raise NotSupportedValue.new("Quantity needs to be >= 0") if product_quantity < 0

      (product_quantity / 2 * base_price) + (product_quantity % 2 * base_price)
    end
  end
end
