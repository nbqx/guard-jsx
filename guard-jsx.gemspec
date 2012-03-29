# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/jsx/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["nbqx"]
  gem.email         = ["nbqxnbq@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guard-jsx"
  gem.require_paths = ["lib"]
  gem.version       = Guard::Jsx::VERSION

  gem.add_dependency 'guard', '>= 1.0.1'
  gem.add_dependency 'sprockets', '>= 2.3.1'

  gem.add_development_dependency 'guard-rspec', '~> 0.7.0'
  gem.add_development_dependency 'rspec', '~> 2.8.0'
end
