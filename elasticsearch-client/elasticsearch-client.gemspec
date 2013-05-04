# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticsearch/client/version'

Gem::Specification.new do |s|
  s.name          = "elasticsearch-client"
  s.version       = Elasticsearch::Client::VERSION
  s.authors       = ["Karel Minarik"]
  s.email         = ["karel.minarik@elasticsearch.org"]
  s.summary       = "Ruby client for Elasticsearch."
  s.homepage      = "http://github.com/elasticsearch/elasticsearch-ruby"
  s.license       = "Apache 2"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.extra_rdoc_files  = [ "README.md", "LICENSE.txt" ]
  s.rdoc_options      = [ "--charset=UTF-8" ]

  s.add_dependency "multi_json"
  s.add_dependency "faraday"

  if defined?(RUBY_VERSION) && RUBY_VERSION < '1.9'
    s.add_dependency "system_timer"
  end
  s.add_development_dependency "bundler", "> 1"
  s.add_development_dependency "rake"

  s.add_development_dependency "shoulda-context"
  s.add_development_dependency "mocha"
  s.add_development_dependency "turn"
  s.add_development_dependency "yard"

  # Gems for testing integrations
  s.add_development_dependency "curb"

  if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
    s.add_development_dependency "simplecov"
    s.add_development_dependency "cane"
    s.add_development_dependency "require-prof"
  end

  s.description = <<-DESC.gsub(/^    /, '')
    Ruby client for Elasticsearch.
  DESC
end