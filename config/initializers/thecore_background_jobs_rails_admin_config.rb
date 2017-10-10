RailsAdmin.config do |config|
  config.navigation_static_label = I18n.t("admin.settings.label")
  config.navigation_static_links = {
    "Sidekiq Dashboard" => "#{ENV['RAILS_RELATIVE_URL_ROOT']}/app/sidekiq"
  }
end
