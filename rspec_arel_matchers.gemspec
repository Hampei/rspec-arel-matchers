# -*- encoding: utf-8 -*-

require File.expand_path('../lib/rspec/arel_matchers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rspec-arel-matchers"
  gem.version       = Rspec::ArelMatchers::VERSION
  gem.summary       = %q{Efficient way to test complex queries}
  gem.description   = %q{Adds rspec matchers to test complex active_record queries in parts}
  gem.license       = "MIT"
  gem.authors       = ["Henk van der Veen"]
  gem.email         = "henk@vanderveen.name"
  gem.homepage      = "https://github.com/hampei/rspec_arel_matchers"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']

  gem.add_dependency 'rspec',             '~> 3.0'
  gem.add_dependency 'activerecord',      '~> 4.0'
end
