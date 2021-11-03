# frozen_string_literal: true

RSpec.describe CodebreakerGem::Entities::Guess do
  subject(:guess) { described_class.new(digit) }

  let(:digit) { '1234' }

  context '#success test' do
    it 'will not raise an error if input is valid' do
      expect { guess }.not_to raise_error
    end
  end
end
