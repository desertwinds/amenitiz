# frozen_string_literal: true

module Amenitiz
  module Rules
    # Rule for calculating final price when we want to apply a fixed discount after having
    # a certain threshold of items.
    class BulkWithDiscount < BaseRule
      attr_accessor :discount, :threshold

      def initialize(base_price:, discount:, threshold:)
        super(base_price: base_price)

        raise InvalidDiscount, 'Discount needs to be between 0 and 1' if discount > 1 || discount.negative?

        @discount = discount
        @threshold = threshold
      end

      def calculate(product_quantity)
        raise NotSupportedValue, 'Quantity needs to be >= 0' if product_quantity.negative?

        return product_quantity * (base_price * discount) if product_quantity >= threshold

        product_quantity * base_price
      end
    end
  end
end
