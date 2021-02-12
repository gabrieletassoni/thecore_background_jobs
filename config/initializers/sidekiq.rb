require 'rails_admin_settings'

Sidekiq.configure_server do |config|
    config.redis = { url: Settings.ns(:sidekiq).redis_url }
end

Sidekiq.configure_client do |config|
    config.redis = { url: Settings.ns(:sidekiq).redis_url }
end