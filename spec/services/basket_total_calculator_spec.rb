# frozen_string_literal: true

require 'spec_helper'
require 'pry'

RSpec.describe Amenitiz::BasketTotalCalculator do
  subject { described_class.new(product_list: product_list) }

  describe '#calculate_total' do
    context 'when there are no products' do
      let(:product_list) { [] }

      it 'returns default base state' do
        expect(subject.calculate_total).to eq([0, []])
      end
    end

    context 'when there are not supported products on the list' do
      let(:product_list) { ['NO_PRODUCT'] }

      it 'returns default base state' do
        expect(subject.calculate_total).to eq([0, ['NO_PRODUCT']])
      end
    end

    context 'when there are supported products on the list' do
      let(:product_list) { %w[GR1 CF1 SR1 CF1 CF1] }
      it 'returns the total calculation' do
        expect(subject.calculate_total).to eq([30.57, []])
      end
    end
  end
end
