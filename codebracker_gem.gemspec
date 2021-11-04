# frozen_string_literal: true

require_relative 'lib/codebreaker_gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'codebreaker_gem'
  spec.version       = CodebreakerGem::VERSION
  spec.authors       = ['Ivan Hulko']
  spec.email         = ['ivanhulko14@gmail.com']

  spec.summary       = 'Codebreaker'
  spec.description   = 'Codebreaker'
  spec.homepage      = 'https://github.com/SweatyRabbit/codebreaker'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SweatyRabbit/codebreaker'
  spec.metadata['changelog_uri'] = 'https://github.com/SweatyRabbit/codebreaker'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'pry'
  spec.add_development_dependency 'fasterer', '~>0.9.0'
  spec.add_development_dependency 'rspec', '~>3.10.0'
  spec.add_development_dependency 'rubocop', '~>1.22.3'
  spec.add_development_dependency 'rubocop-performance', '~>1.12.0'
  spec.add_development_dependency 'rubocop-rspec', '~>2.5.0'
  spec.add_development_dependency 'simplecov', '~>0.21.2'
end
