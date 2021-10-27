# frozen_string_literal: true

RSpec.describe User do
  subject(:user) { described_class.new(name) }

  let(:name) { 'Ivan' }

  it 'valid' do
    expect(user).to be_truthy
  end
end
