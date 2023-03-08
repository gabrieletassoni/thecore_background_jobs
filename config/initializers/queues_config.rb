# Set the default queue name for the analysis job to the queue adapter default.
Rails.application.config.active_storage.queues.analysis = "#{ENV['COMPOSE_PROJECT_NAME'].presence || 'notset'}_storage_analysis"

# Set the default queue name for the purge job to the queue adapter default.
Rails.application.config.active_storage.queues.purge = "#{ENV['COMPOSE_PROJECT_NAME'].presence || 'notset'}_storage_purge"

# Set the default queue name for the incineration job to the queue adapter default.
Rails.application.config.action_mailbox.queues.incineration = "#{ENV['COMPOSE_PROJECT_NAME'].presence || 'notset'}_mailbox_incinerate"

# Set the default queue name for the routing job to the queue adapter default.
Rails.application.config.action_mailbox.queues.routing = "#{ENV['COMPOSE_PROJECT_NAME'].presence || 'notset'}_mailbox_routing"

# Set the default queue name for the mail deliver job to the queue adapter default.
Rails.application.config.action_mailer.deliver_later_queue_name = "#{ENV['COMPOSE_PROJECT_NAME'].presence || 'notset'}_mailers"