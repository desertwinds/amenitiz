# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amenitiz::TwoForOne do
  describe '#calculate' do
    subject { described_class.new(base_price: 5) }

    context 'when there are < 0 products' do
      it 'raises a not supported value error' do
        expect { subject.calculate(-1) }.to raise_error(Amenitiz::NotSupportedValue)
      end
    end

    context 'when there is an even amount of products' do
      it 'applies the discount entirely' do
        expect(subject.calculate(0)).to eq(0)
        expect(subject.calculate(2)).to eq(5)
        expect(subject.calculate(4)).to eq(10)
      end
    end

    context 'when there is an odd amount of products' do
      it 'applies the discount only to the first n-1 products' do
        expect(subject.calculate(1)).to eq(5)
        expect(subject.calculate(3)).to eq(10)
        expect(subject.calculate(5)).to eq(15)
      end
    end
  end
end
