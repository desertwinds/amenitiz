# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amenitiz::BaseRule do
  describe '#new' do
    it "requires a base_price" do
      expect { described_class.new }.to raise_error
      expect { described_class.new(base_price: 1) }.to_not raise_error
    end
  end

  describe '#calculate' do
    it 'raises a MissingDefinition error' do
      expect { described_class.new(base_price: 1).calculate(5) }.to raise_error(Amenitiz::MissingDefinition)
    end
  end
end
