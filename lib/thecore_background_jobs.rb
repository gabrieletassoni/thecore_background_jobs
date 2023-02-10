require 'redis-namespace'
require 'sidekiq'
require 'sidekiq-scheduler'
require 'sidekiq-failures'
require "thecore_background_jobs/engine"

module ThecoreBackgroundJobs
  # Your code goes here...
  def self.email_setup
    delivery_options = { domain: Settings.ns(:smtp).domain, address: Settings.ns(:smtp).address, port: Settings.ns(:smtp).port.to_i, enable_starttls_auto: (Settings.ns(:smtp).enable_starttls_auto == "true")}
    # Other Options
    delivery_options.merge!({user_name: Settings.ns(:smtp).user_name}) unless Settings.ns(:smtp).user_name.blank?
    delivery_options.merge!({password: Settings.ns(:smtp).password}) unless Settings.ns(:smtp).password.blank?
    delivery_options.merge!({authentication: Settings.ns(:smtp).authentication}) unless Settings.ns(:smtp).authentication.blank? 
    delivery_options
  end

  def self.update_cron_schedules
    # {
    #  "AlertForLongTermStockJob"=>{"cron"=>"0 0 9 * * *", "queue"=>"notset_default", "description"=>"This job Alerts a reference email for items in stock for too long", "enabled"=>true, "class"=>"AlertForLongTermStockJob"}, 
    #  "ScheduleEmployeeReminderForInStockParcelsJob"=>{"cron"=>"0 0 8,14 * * *", "queue"=>"notset_default", "description"=>"This job checks periodically for new received parcels", "enabled"=>true, "class"=>"ScheduleEmployeeReminderForInStockParcelsJob"}
    # }
    begin
      Sidekiq.get_all_schedules.each_pair do |key, config|
        Rails.logger.info "Key: #{key}, Config: #{config}"
        schedule = "cron_for_#{key.underscore}"
        setting = ThecoreSettings::Setting.where(ns: "schedules", key: schedule).pluck(:raw).first
        Rails.logger.info "Setting is #{schedule} = #{setting}"
        # Installing initial sidekiq.yml configuration if setting is not present
        if setting.blank?
          Rails.logger.info "Setting #{schedule} doesn't exist, creating based on current value: #{config["cron"]}"
          ThecoreSettings::Setting.create(ns: "schedules", key: schedule, raw: config["cron"])
          # Settings.ns("schedules").send("#{schedule}=", config["cron"])
        elsif config["cron"].squeeze(" ").strip != setting.squeeze(" ").strip
          # If we have a setting and is different from the currently loaded, then replace it 
          # in scheduler configuration
          Rails.logger.info "Setting #{schedule} exists: #{setting}"
          Sidekiq.set_schedule(key, { cron: setting.squeeze(" ").strip, queue: "#{ENV["COMPOSE_PROJECT_NAME"]}_default", class: key })
          Rails.logger.info "Reloading schedules"
          SidekiqScheduler::Scheduler.instance.reload_schedule!
        end
      end 
    rescue => exception
      Rails.logger.info "Thecore Background Jobs: REDIS not reachable:"
      Rails.logger.info exception.message
    end
  end
end
