# frozen_string_literal: true

RSpec.describe CodebreakerGem::Entities::Difficulty do
  subject(:difficulty) { described_class.new(level) }

  let(:level) { :medium }
  let(:easy_difficulty) { described_class.new(:easy) }
  let(:medium_difficulty) { described_class.new(:medium) }
  let(:hell_difficulty) { described_class.new(:hell) }

  describe '#success tests' do
    it 'will not raise an error if difficulty is correct' do
      expect { difficulty }.not_to raise_error
    end

    it 'will not raise error if attempts are equal' do
      expect(difficulty.attempts).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level][:attempts])
    end

    it 'will not raise error if hints are equal' do
      expect(difficulty.hints).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level][:hints])
    end

    it 'is not equal to another difficulty with less amount attempts and hints' do
      expect(difficulty <=> easy_difficulty).to eq(-1)
    end

    it 'is equal to another difficulty with same attempts and hints' do
      expect(difficulty <=> medium_difficulty).to eq(0)
    end

    it 'is not equal to another difficulty with greater amount attempts and hints' do
      expect(difficulty <=> hell_difficulty).to eq(1)
    end
  end
end
