$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_tags/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_tags"
  s.version     = SimpleTags::VERSION
  s.authors     = ["Tiago Scolari"]
  s.email       = ["tscolari@gmail.com"]
  s.homepage    = "https://github.com/tscolari/simple_tags"
  s.summary     = "Simple Tagging Gem"
  s.description = "Simple tagging system for Ruby on Rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0.0.rc1"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "ffaker"
  s.add_development_dependency "shoulda-matchers"

end
