# Not so good, but let's try
RailsAdmin.config do |config|
    (config.navigation_static_links ||= {}).merge! "Background Monitor" => "#{ENV['RAILS_RELATIVE_URL_ROOT']}/app/sidekiq"
end