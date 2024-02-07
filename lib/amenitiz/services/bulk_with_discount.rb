module Amenitiz
  class BulkWithDiscount < BaseRule
    attr_accessor :discount, :threshold

    def initialize(base_price:, discount:, threshold:)
      super(base_price: base_price)

      raise InvalidDiscount.new("Discount needs to be between 0 and 1") if discount > 1 || discount < 0
      @discount = discount
      @threshold = threshold
    end

    def calculate(product_quantity)
      raise NotSupportedValue.new("Quantity needs to be >= 0") if product_quantity < 0

      return product_quantity * (base_price * discount) if product_quantity >= threshold
        
      product_quantity * base_price
    end
  end
end
