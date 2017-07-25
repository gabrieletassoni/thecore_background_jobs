Rails.application.routes.draw do
  require 'sidekiq/web'
  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
  authenticate do
    mount Sidekiq::Web, at: "/app/sidekiq"
  end
  # mount Sidekiq::Web => '/sidekiq', :constraints => AdminConstraint.new
end
