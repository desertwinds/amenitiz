# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amenitiz::BulkWithDiscount do
  describe '#initialize' do
    it 'requires a discount and threshold' do
      expect { described_class.new(base_price: 5) }.to raise_error
      expect { described_class.new(base_price: 5, discount: 1 / 2.to_f, threshold: 3) }.to_not raise_error
    end

    it 'requires the discount to be between 0 and 1' do
      expect { described_class.new(base_price: 5, discount: 2, threshold: 3) }.to raise_error(Amenitiz::InvalidDiscount)
      expect do
        described_class.new(base_price: 5, discount: -1, threshold: 3)
      end.to raise_error(Amenitiz::InvalidDiscount)
    end
  end

  describe '#calculate' do
    let(:threshold) { 3 }
    subject { described_class.new(base_price: 5, discount: 1 / 2.to_f, threshold: threshold) }

    context 'when there are < 0 products' do
      it 'raises a not supported value error' do
        expect { subject.calculate(-1) }.to raise_error(Amenitiz::NotSupportedValue)
      end
    end

    context 'when there are not enough products for the discount' do
      it 'calculates the total without applying the discount' do
        expect(subject.calculate(threshold - 1)).to eq(10)
      end
    end

    context 'when there are enough products for the discount' do
      it 'calculates the total with the discount on the base price' do
        expect(subject.calculate(threshold)).to eq(7.5)
        expect(subject.calculate(3 + 1)).to eq(10)
      end
    end
  end
end
