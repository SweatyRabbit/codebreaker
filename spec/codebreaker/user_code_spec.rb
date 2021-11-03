# frozen_string_literal: true

RSpec.describe CodebreakerGem::Entities::UserCode do
  subject(:code) { described_class.new(secret_code, guess_code) }

  describe '#test will pass if all match' do
    test_codes = [{ secret_code: [6, 5, 4, 3], guess_code: [5, 6, 4, 3], answer: '++--' },
                  { secret_code: [6, 5, 4, 3], guess_code: [6, 4, 1, 1], answer: '+-' },
                  { secret_code: [6, 5, 4, 3], guess_code: [6, 5, 4, 4], answer: '+++' },
                  { secret_code: [6, 5, 4, 3], guess_code: [3, 4, 5, 6], answer: '----' },
                  { secret_code: [6, 5, 4, 3], guess_code: [6, 6, 6, 6], answer: '+' },
                  { secret_code: [6, 5, 4, 3], guess_code: [2, 6, 6, 6], answer: '-' },
                  { secret_code: [6, 5, 4, 3], guess_code: [2, 2, 2, 2], answer: '' },
                  { secret_code: [6, 6, 6, 6], guess_code: [1, 6, 6, 1], answer: '++' },
                  { secret_code: [1, 2, 3, 4], guess_code: [3, 1, 2, 4], answer: '+---' },
                  { secret_code: [1, 2, 3, 4], guess_code: [1, 5, 2, 4], answer: '++-' },
                  { secret_code: [1, 2, 3, 4], guess_code: [1, 2, 3, 4], answer: '++++' }]

    test_codes.each do |test_code|
      secret_code = test_code[:secret_code]
      guess_code = test_code[:guess_code]
      answer = test_code[:answer]

      it "must return '#{answer}' when secret code: #{secret_code} and guess code: #{guess_code}" do
        code = described_class.new(secret_code, guess_code)
        expect(code.match).to eq answer
      end
    end
  end
end
