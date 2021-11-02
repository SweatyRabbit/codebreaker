# frozen_string_literal: true

RSpec.describe CodebreakerGem::Entities::Game do
  subject(:game) { described_class.new(name, level) }

  let(:name) { 'Ivan' }
  let(:level) { 'easy' }

  context 'success tests' do
    it 'return true if input is valid' do
      expect(game).to be_truthy
    end

    it 'use attempt' do
      attempt = '1234'
      game.use_attempt(attempt)
      expect(game.user_attempts).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level.to_sym][:attempts] - 1)
    end

    it 'return true if codes are match' do
      guess = CodebreakerGem::Entities::Guess.new('1234').parse_code
      game.instance_variable_set(:@secret_code, guess)
      game.instance_variable_set(:@guess, guess)
      expect(game.win?).to be_truthy
    end

    it 'return true if attempts are equal to 0' do
      game.instance_variable_set(:@user_attempts, 0)
      expect(game.lose?).to be_truthy
    end

    it 'use hint' do
      game.use_hint
      expect(game.user_hints).to eq(CodebreakerGem::Entities::Difficulty::DIFFICULTIES[level.to_sym][:hints] - 1)
    end

    it 'return true if statistic is valid' do
      attempt = '1234'
      game.use_attempt(attempt)
      game.use_hint
      expect(game.current_statistic).to be_truthy
    end

    it 'return true if statistic is saving to db' do
      attempt = '1234'
      4.times { game.use_attempt(attempt) }
      expect(game.save_current_statistic).to be_truthy
    end

    it 'return true if users stistic is sorted' do
      expect(CodebreakerGem::Entities::Game.users_statistic).to be_truthy
    end
  end

  context 'failure tests' do
    it 'return false if codes are not match' do
      guess = CodebreakerGem::Entities::Guess.new('1234').parse_code
      game.instance_variable_set(:@guess, guess)
      expect(game.win?).to be_falsy
    end

    it 'return false if attempts are not equal to 0' do
      game.instance_variable_set(:@user_attempts, 1)
      expect(game.lose?).to be_falsy
    end
  end
end
