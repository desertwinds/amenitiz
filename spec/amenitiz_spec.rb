# frozen_string_literal: true

RSpec.describe Amenitiz do
  it 'has a version number' do
    expect(Amenitiz::VERSION).not_to be nil
  end

  describe '#calculate_via_cli' do
    context 'when receiving a list of products' do
      before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('SR1,CF1,AB2', 'q')
      end

      it 'prints a table with the calculated price' do
        expect { described_class.calculate_via_cli }.to output(
          include(
            Amenitiz.hello_message,
            'Basket',
            'Total price expected',
            'Missing products',
            'SR1,CF1,AB2',
            '16.23',
            '"AB2"',
            'Goodbye.'
          )
        ).to_stdout
      end
    end

    context 'when receiving only the "q" statement' do
      before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('q')
      end

      it 'prints goodbye and returns' do
        expect { described_class.calculate_via_cli }.to output(include('Goodbye.')).to_stdout
      end
    end
  end
end
