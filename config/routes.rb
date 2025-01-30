Rails.application.routes.draw do
    require 'sidekiq/web'
    require 'sidekiq-scheduler/web'
    
    # Allow any authenticated User with admin capability
    authenticate :user, lambda { |u| u.admin? } do
        mount Sidekiq::Web => "#{ENV.fetch('RAILS_RELATIVE_URL_ROOT', '/')}/sidekiq".gsub('//', '/')
    end
end
