puts "Settings Concern from ThecoreBackgroundJobs"
require 'active_support/concern'

module ThecoreBackgroundSettingsConcern
    extend ActiveSupport::Concern
    included do
        after_save :reload_schedules, if: :saved_change_to_raw?
        
        def reload_schedules
            # Reload changes to schedule
            ThecoreBackgroundJobs.update_cron_schedules if self.ns == "schedules" && !self.raw.blank?
        end
    end
end
