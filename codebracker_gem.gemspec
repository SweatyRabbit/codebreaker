# frozen_string_literal: true

require_relative 'lib/codebreaker_gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'codebracker_gem'
  spec.version       = CodebrackerGem::VERSION
  spec.authors       = ['Ivan Hulko']
  spec.email         = ['ivanhulko14@gmail.com']

  spec.summary       = 'Codebreaker'
  spec.description   = 'Codebreaker'
  spec.homepage      = 'https://github.com/SweatyRabbit/codebreaker.git'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SweatyRabbit/codebreaker.git'
  spec.metadata['changelog_uri'] = 'https://github.com/SweatyRabbit/codebreaker.git'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'pry'
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
end
