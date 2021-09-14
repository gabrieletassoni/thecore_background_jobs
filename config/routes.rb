Rails.application.routes.draw do
  require 'sidekiq/web'
  
  # Allow any authenticated User with admin capability
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
