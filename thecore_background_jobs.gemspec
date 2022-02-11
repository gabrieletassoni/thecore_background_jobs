$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "thecore_background_jobs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "thecore_background_jobs"
  s.version     = ThecoreBackgroundJobs::VERSION
  s.authors     = ["Gabriele Tassoni"]
  s.email       = ["gabriele.tassoni@gmail.com"]
  s.homepage = 'https://www.taris.it' #    = "TODO"
  s.summary = 'Thecorized thecore_background_jobs' #     = "TODO: Summary of ThecoreBackgroundJobs."
  s.description = 'Thecorized thecore_background_jobs full description.' # = "TODO: Description of ThecoreBackgroundJobs."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # s.add_dependency "rails", "~> 5.1.2"

  # s.add_development_dependency "sqlite3"
  s.add_dependency 'thecore_backend_commons', '~> 2.4'
  s.add_dependency 'redis-namespace', '~> 1.8'
  s.add_dependency 'sidekiq', '~> 6.0'
  s.add_dependency 'sidekiq-scheduler', '~> 3.0'
  s.add_dependency 'sidekiq-failures', '~> 1.0'
  
end
