$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "healthcheck/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aws-healthcheck"
  s.version     = Healthcheck::VERSION
  s.authors     = ["Logan Serman"]
  s.email       = ["loganserman@gmail.com"]
  s.homepage    = "http://github.com/lserman/healthcheck"
  s.summary     = "Mounts a Rack app at /healthcheck that returns a 200 for AWS load balancers"
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0"
  s.add_development_dependency "sqlite3"

end
