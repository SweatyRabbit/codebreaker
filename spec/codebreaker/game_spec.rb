# frozen_string_literal: true

RSpec.describe CodebreakerGem::Entities::Game do
  subject(:game) { described_class.new(name, level) }

  let(:name) { 'Ivan' }
  let(:level) { 'easy' }
  let(:attempt) { '1234' }

  describe '#success tests' do
    before do
      guess = CodebreakerGem::Entities::Guess.new(attempt).parse_code
      game.instance_variable_set(:@secret_code, guess)
      game.instance_variable_set(:@guess, guess)
      game.use_attempt(attempt)
      game.use_hint
    end

    it 'return true if input is valid' do
      expect(game).to be_truthy
    end

    it 'use attempt' do
      expect(game.user_attempts).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level.to_sym][:attempts] - 1)
    end

    it 'return true if codes are match' do
      expect(game.win?).to be_truthy
    end

    context '#attempts are equal to 0' do
      before do
        game.instance_variable_set(:@user_attempts, 0)
      end
      it 'return true if attempts are equal to 0' do
        expect(game.lose?).to be_truthy
      end
    end

    it 'use hint' do
      expect(game.user_hints).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level.to_sym][:hints] - 1)
    end

    it 'return true if statistic is valid' do
      expect(game.current_statistic.attempts).to eq(1)
      expect(game.current_statistic.name).to eq(game.name)
      expect(game.current_statistic.hints).to eq(1)
    end

    it 'return true if statistic is saving to db' do
      expect(game.save_current_statistic).to be_truthy
    end

    it 'return true if users stistic is sorted' do
      expect(CodebreakerGem::Entities::Game.users_statistic).to be_truthy
    end
  end

  describe '#failure tests' do
    before do
      game.instance_variable_set(:@guess, attempt)
      game.instance_variable_set(:@user_attempts, 1)
    end
    it 'return false if codes are not match' do
      expect(game.win?).to be_falsy
    end

    it 'return false if attempts are not equal to 0' do
      expect(game.lose?).to be_falsy
    end
  end
end
