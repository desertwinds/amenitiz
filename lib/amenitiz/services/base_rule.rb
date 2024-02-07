module Amenitiz
  class BaseRule
    attr_accessor :base_price

    def initialize(base_price:)
      @base_price = base_price
    end

    def calculate(product_quantity)
      raise MissingDefinition.new("Please define your rule calculation.")
    end
  end
end
