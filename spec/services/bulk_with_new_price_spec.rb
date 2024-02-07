# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amenitiz::BulkWithNewPrice do
  describe '#initialize' do
    it "requires a new_price and threshold" do
      expect { described_class.new(base_price: 5) }.to raise_error
      expect { described_class.new(base_price: 5, new_price: 3, threshold: 3) }.to_not raise_error
    end
  end

  describe '#calculate' do
    let(:threshold) { 3 }
    subject { described_class.new(base_price: 5, new_price: 3, threshold: threshold) }

    context 'when there are < 0 products' do
      it 'raises a not supported value error' do
        expect { subject.calculate(-1) }.to raise_error(Amenitiz::NotSupportedValue)
      end
    end

    context 'when there are not enough products for the discount' do
      it 'calculates the total without changing the base price' do
        expect(subject.calculate(threshold - 1)).to eq(10)
      end
    end

    context 'when there are enough products for the discount' do
      it 'calculates the total with the new base price' do
        expect(subject.calculate(threshold)).to eq(9)
        expect(subject.calculate(3 + 1)).to eq(12)
      end
    end
  end
end
