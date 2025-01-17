Rails.application.routes.draw do
    require 'sidekiq/web'
    require 'sidekiq-scheduler/web'
    
    # Allow any authenticated User with admin capability
    authenticate :user, lambda { |u| u.admin? } do
        scope ENV.fetch("RAILS_RELATIVE_URL_ROOT", "/") do
           mount Sidekiq::Web => "/sidekiq"
        end
    end
end
