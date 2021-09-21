require 'thecore_backend_commons'
require 'sidekiq'
require "sidekiq-scheduler"
require "sidekiq-failures"
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
end
