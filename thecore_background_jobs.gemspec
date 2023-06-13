$:.push File.expand_path("lib", __dir__)

require_relative "lib/thecore_background_jobs/version"

Gem::Specification.new do |spec|
  spec.name        = "thecore_background_jobs"
  spec.version     = ThecoreBackgroundJobs::VERSION
  spec.authors     = ["Gabriele Tassoni"]
  spec.email       = ["g.tassoni@bancolini.com"]
  spec.homepage    = "https://github.com/gabrieletassoni/thecore_background_jobs"
  spec.summary     = "Background workers for Thecore"
  spec.description = "Adds Background workers functionality and management to Thecore."
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gabrieletassoni/thecore_background_jobs"
  spec.metadata["changelog_uri"] = "https://github.com/gabrieletassoni/thecore_background_jobs/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency 'redis-namespace', '~> 1.8'
  spec.add_dependency 'sidekiq', '~> 7.0'
  spec.add_dependency 'sidekiq-scheduler', '~> 5.0'
  spec.add_dependency 'sidekiq-failures', '~> 1.0'
end
