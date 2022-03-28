# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hubdown/version'

Gem::Specification.new do |gem|
  gem.name          = "hubdown"
  gem.version       = Hubdown::VERSION
  gem.authors       = ["jsk"]
  gem.email         = ["knomedia@gmail.com"]
  gem.description   = %q{CLI for GitHub Flavored markdown to html convervsion}
  gem.summary       = %q{CLI for GitHub Flavored markdown to html conversion}
  gem.homepage      = "https://github.com/knomedia/hubdown"
  gem.license       = "MIT"

  gem.add_dependency('mixlib-cli', '~> 1.2', '>=1.2.2')
  gem.add_dependency('nokogiri', '~> 1.5', '>=1.5.6')
  gem.add_dependency('redcarpet', '~> 3.5', '>= 3.5.1')
  gem.add_dependency('pygments.rb', "~> 0.6.3")

  gem.add_development_dependency 'pry'
  gem.add_development_dependency "rspec", "~> 2.0", ">= 2.0.0"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
