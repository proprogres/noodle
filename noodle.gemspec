$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "noodle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "noodle"
  s.version     = Noodle::VERSION
  s.authors     = ["LA"]
  s.email       = ["leszek.albrzykowski@nobleprog.pl"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Noodle."
  s.description = "TODO: Description of Noodle."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.7.1"

  s.add_development_dependency "sqlite3"
end
