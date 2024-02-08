# frozen_string_literal: true

require_relative 'amenitiz/version'
require_relative 'amenitiz/services'
require 'terminal-table'

# Entry level for our calculator. This will be running on a loop until the user enters 'q' to leave.
module Amenitiz
  class MissingDefinition < StandardError; end
  class NotSupportedValue < StandardError; end
  class InvalidDiscount < StandardError; end

  def self.calculate_via_cli
    puts hello_message

    loop do
      product_list = gets.chomp
      return if program_should_exit(product_list)

      basket_total = calculate_total(product_list)
      print_table(product_list, basket_total)

      puts 'Please introduce a new basket, or enter "q" to exit'
    end
  end

  def self.calculate_total(product_list)
    basket_total = BasketTotalCalculator.new(product_list: product_list.split(','))
    basket_total.calculate_total

    basket_total
  end

  def self.print_table(product_list, basket_total)
    table = Terminal::Table.new(
      headings: ['Basket', 'Total price expected', 'Missing products'],
      rows: [[product_list, basket_total.total_price, basket_total.missing_products]]
    )

    puts table
  end

  def self.hello_message
    'Hello there, in order to calculate your basket total, please provide us with your '\
    'list comma separated, e.g., "SR1,CF1"'
  end

  def self.program_should_exit(product_list)
    if product_list == 'q'
      puts 'Goodbye.'
      return true
    end

    false
  end
end
