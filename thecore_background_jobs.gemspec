$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'thecore_background_jobs/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'thecore_background_jobs'
  spec.version     = ThecoreBackgroundJobs::VERSION
  spec.authors     = ['Gabriele Tassoni']
  spec.email       = ['gabriele.tassoni@gmail.com']
  spec.homepage    = 'https://www.taris.it' #    = 'TODO'
  spec.summary     = 'Thecorized thecore_background_jobs' #     = 'TODO: Summary of ThecoreBackgroundJobs.'
  spec.description = 'Thecorized thecore_background_jobs full description.' # = 'TODO: Description of ThecoreBackgroundJobs.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.required_ruby_version = '>= 2.7.7'

  # s.add_dependency 'rails', '~> 5.1.2'

  # s.add_development_dependency 'sqlite3'

  # Thecore
  spec.add_dependency 'thecore_backend_commons', '~> 2.4'

  # Background jobs
  spec.add_dependency 'redis-namespace', '~> 1.8'
  spec.add_dependency 'sidekiq', '~> 6.0'
  spec.add_dependency 'sidekiq-scheduler', '~> 3.0'
  spec.add_dependency 'sidekiq-failures', '~> 1.0'
end
