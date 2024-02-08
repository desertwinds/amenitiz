# frozen_string_literal: true

require_relative 'rules'

module Amenitiz
  # This class is responsible for receiving a list of products, and based on
  # their corresponding discount rules, apply the necessary calculations and
  # return the total final price, and an array of missing products.
  class BasketTotalCalculator
    attr_reader :product_list
    attr_accessor :total_price, :missing_products

    # TODO: This should instead come direrectly from database. Also, yearning for #hash_with_indifferent_access
    PRICING_RULES = {
      GR1: Amenitiz::Rules::TwoForOne.new(base_price: 3.11),
      SR1: Amenitiz::Rules::BulkWithNewPrice.new(base_price: 5.00, new_price: 4.50, threshold: 3),
      CF1: Amenitiz::Rules::BulkWithDiscount.new(base_price: 11.23, discount: 2 / 3.to_f, threshold: 3)
    }.freeze

    def initialize(product_list: [])
      @product_list = product_list
      @total_price = 0
      @missing_products = []
    end

    def calculate_total
      product_list.tally.each do |product, count|
        if PRICING_RULES[product.to_sym]
          self.total_price += PRICING_RULES[product.to_sym].calculate(count)
        else
          missing_products.push(product)
        end
      end

      [total_price, missing_products]
    end
  end
end
