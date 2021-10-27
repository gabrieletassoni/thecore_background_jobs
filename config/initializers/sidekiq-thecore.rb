require 'sidekiq'

current_db = rand(1..15)

Sidekiq.configure_server do |config|
    config.redis = { :namespace => "#{ENV['COMPOSE_PROJECT_NAME'] || 'notset'}", :url => "#{ENV['REDIS_URL']}/#{current_db}" }
end
Sidekiq.configure_client do |config|
    config.redis = { :namespace => "#{ENV['COMPOSE_PROJECT_NAME'] || 'notset'}", :url => "#{ENV['REDIS_URL']}/#{current_db}" }
end