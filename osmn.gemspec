# -*- encoding: utf-8 -*-
require File.expand_path('../lib/osmn/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'osmn'
  gem.version     = OSMN::VERSION
  gem.authors     = ["Jorge Kalmbach"]
  gem.email       = "kalmbach@gmail.com"
  gem.description = "A Ruby wrapper for the OpenStreetMap Nominatim API."
  gem.summary     = "A Ruby wrapper for the OpenStreetMap Nominatim API."
  gem.homepage    = "http://github.com/kalmbach/osmn"
  gem.files       = [
    "README.md",
    "LICENSE",
    "Rakefile",
    "lib/osmn.rb",
    "lib/osmn/structs.rb",
    "lib/osmn/base.rb",
    "lib/osmn/search.rb",
    "lib/osmn/reverse.rb",
    "lib/osmn/version.rb",
    "test/test_osmn.rb"
  ]

  gem.test_files    = ["test/test_osmn.rb"]
  gem.require_paths = ["lib"]

  gem.add_dependency 'json'

  gem.add_development_dependency 'rake'
end
