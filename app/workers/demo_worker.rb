class DemoWorker
    include Sidekiq::Worker
    sidekiq_options retry: false, queue: "#{ENV["COMPOSE_PROJECT_NAME"]}_default"
    
    def perform(*args)
        puts "Worker is working"
    end
end
