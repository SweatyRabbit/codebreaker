# frozen_string_literal: true

RSpec.describe CodebreakerGem::Entities::Difficulty do
  subject(:difficulty) { described_class.new(level) }

  let(:level) { :easy }
  let(:easy_difficulty) { described_class.new(:easy) }
  let(:medium_difficulty) { described_class.new(:medium) }
  let(:hell_difficulty) { described_class.new(:hell) }

  it 'check difficulty attempts' do
    expect(difficulty.attempts).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level][:attempts])
  end

  it 'check difficulty hint' do
    expect(difficulty.hints).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level][:hints])
  end

  it 'is equal to another difficulty with same attempts and hints' do
    expect(difficulty <=> easy_difficulty).to eq(0)
  end

  it 'is not equal to medium level' do
    expect(difficulty <=> medium_difficulty).to eq(1)
  end

  it 'is not equal to hell level' do
    expect(difficulty <=> hell_difficulty).to eq(1)
  end
end
