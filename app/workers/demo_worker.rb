class DemoWorker
    include Sidekiq::Worker
    sidekiq_options retry: false, queue: "#{ENV['COMPOSE_PROJECT_NAME'].presence || 'notset'}_default"
    
    def perform(*args)
        puts "Worker is working"
    end
end
