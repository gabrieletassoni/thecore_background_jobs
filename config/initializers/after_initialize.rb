Rails.application.configure do
    config.after_initialize do
        ThecoreBackgroundJobs.update_cron_schedules
        ThecoreSettings::Setting.send(:include, ThecoreBackgroundSettingsConcern)
    end
end