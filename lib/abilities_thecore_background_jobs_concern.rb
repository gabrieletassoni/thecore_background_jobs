
require 'active_support/concern'

module ThecoreBackgroundJobAbilitiesConcern
  extend ActiveSupport::Concern
  included do
    def thecore_background_jobs_abilities user
      # Not so good, but let's try
      RailsAdmin.config do |config|
        config.navigation_static_label = I18n.t("admin.links.label")
        config.navigation_static_links = {
          "Sidekiq Dashboard" => "#{ENV['RAILS_RELATIVE_URL_ROOT']}/app/sidekiq"
        }
      end
      if user
        # if the user is logged in, it can do certain tasks regardless his role
        if user.admin?
          # if the user is an admin, it can do a lot of things, usually
        end

        if user.has_role? :role
          # a specific role, brings specific powers
        end
      end
    end
  end
end

# include the extension
TheCoreAbilities.send(:include, ThecoreBackgroundJobAbilitiesConcern)
