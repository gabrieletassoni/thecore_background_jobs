class DemoWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "Worker is working"
  end
end
