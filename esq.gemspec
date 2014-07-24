# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'esq/version'

Gem::Specification.new do |spec|
  spec.name          = "esq"
  spec.version       = Esq::VERSION
  spec.authors       = ["Eduardo Turiño"]
  spec.email         = ["eturino@eturino.com"]
  spec.summary       = %q{ElasticSearch Queries, gem that allows elastic creation of complex ES queries, and end up in hashes ready to be used with elasticsearch-model / elasticsearch-rails. Validation enabled. Uses eapi gem)}
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "pry-rescue"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "pry-doc"

  spec.add_dependency 'eapi', '~> 0.6'
end
