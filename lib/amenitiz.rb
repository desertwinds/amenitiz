# frozen_string_literal: true

require_relative 'amenitiz/version'
require_relative 'amenitiz/services'

module Amenitiz
  class MissingDefinition < StandardError; end
  class NotSupportedValue < StandardError; end
  class InvalidDiscount < StandardError; end
end
