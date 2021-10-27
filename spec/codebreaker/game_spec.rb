# frozen_string_literal: true

RSpec.describe Game do
  subject(:game) { described_class.new(name, level) }

  let(:name) { 'Ivan' }
  let(:level) { :easy }

  it 'return true if input is valid' do
    expect(game).to be_truthy
  end

  it 'use attempt' do
    attempt = '1234'
    3.times { game.use_attempt(attempt) }
    expect(game.user_attempts).not_to eq(Difficulty::DIFFICULTIES[level][:attempts])
  end

  it 'return true if codes are match' do
    guess = Guess.new('1234').parse_code
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
    expect(game.user_hints).not_to eq(Difficulty::DIFFICULTIES[level][:hints])
  end

  it 'return true if statistic is valid' do
    attempt = '1234'
    game.use_attempt(attempt)
    game.use_hint
    expect(game.current_statistic).to be_truthy
  end

  it 'return true if statistic is saving in db' do
    attempt = '1234'
    4.times { game.use_attempt(attempt) }
    expect(game.save_current_statistic).to be_truthy
  end

  it 'return true if users stistic is sorted' do
    expect(game.users_statistic).to be_truthy
  end
end
