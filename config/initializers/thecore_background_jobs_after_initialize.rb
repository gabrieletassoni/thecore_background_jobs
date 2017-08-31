# abilities_thecore_background_jobs_concern
Rails.application.configure do
  config.after_initialize do
    require 'abilities_thecore_background_jobs_concern'
  end
end
