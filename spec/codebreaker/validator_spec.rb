# frozen_string_literal: true

RSpec.describe CodebreakerGem::Validator do
  subject(:validation) { class_to_validate.new }
  let(:class_to_validate) { Class.new { include CodebreakerGem::Validator } }

  describe '#filure test' do
    it 'check if name length are not valid' do
      expect { validation.validate_name_length('iv', 3, 20) }.to raise_error(CodebreakerGem::Error::NameLength)
    end

    it 'check if object is not the same class' do
      expect { validation.validate_input_class(1234, String) }.to raise_error(CodebreakerGem::Error::WrongClass)
    end

    it 'check if string don`t have only numbers' do
      expect { validation.validate_input_only_numbers('1a2') }.to raise_error(CodebreakerGem::Error::OnlyNumbers)
    end

    it 'check if input is not in needed range' do
      expect { validation.validate_range_input([1, 5, 3], (1..3)) }.to raise_error(CodebreakerGem::Error::InputRange)
    end

    it 'check if guess length is not valid ' do
      expect { validation.validate_guess_input_length('12', 4, 4) }.to raise_error(CodebreakerGem::Error::MaxStringLength)
    end

    it 'check if difficulty is not valid' do
      expect { validation.validate_difficulty(:med) }.to raise_error(CodebreakerGem::Error::DifficultyHandler)
    end
  end
end
