# frozen_string_literal: true

RSpec.describe CodebreakerGem::Entities::User do
  subject(:user) { described_class.new(name) }

  let(:name) { 'Ivan' }

  context '#success test' do
    it 'will not raise error if name is valid' do
      expect { user }.not_to raise_error
    end
  end
end
