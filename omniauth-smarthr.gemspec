# frozen_string_literal: true

require_relative 'lib/omniauth-smarthr/version'

Gem::Specification.new do |spec|
  spec.name = 'omniauth-smarthr'
  spec.version = Omniauth::Smarthr::VERSION
  spec.authors = ['kei-p']
  spec.email = ['kei-p@sonicgarden.jp']

  spec.summary = ''
  spec.description = ''
  spec.homepage = 'https://github.com/SonicGarden/rakuro'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SonicGarden/rakuro'
  spec.metadata['changelog_uri'] = 'https://github.com/SonicGarden/rakuro'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['CHANGELOG.md', 'MIT-LICENSE', 'README.rdoc', 'lib/**/*']
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.4'

  spec.add_development_dependency 'bundler', '~> 1.11.2'
  spec.add_development_dependency 'rake', '>= 13.0.6'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
