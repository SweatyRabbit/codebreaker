# frozen_string_literal: true

RSpec.describe Guess do
  subject(:guess) { described_class.new(digit) }

  let(:digit) { '1234' }

  it 'return true if input is valid' do
    expect(guess).to be_truthy
  end
end
