module Amenitiz
  class BulkWithNewPrice < BaseRule
    attr_accessor :new_price, :threshold

    def initialize(base_price:, new_price:, threshold:)
      super(base_price: base_price)

      @new_price = new_price
      @threshold = threshold
    end

    def calculate(product_quantity)
      raise NotSupportedValue.new("Quantity needs to be >= 0") if product_quantity < 0

      return product_quantity * new_price if product_quantity >= threshold
        
      product_quantity * base_price
    end
  end
end
