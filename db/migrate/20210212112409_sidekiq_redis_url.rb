class SidekiqRedisUrl < ActiveRecord::Migration[6.0]
  def change
    Settings.ns(:sidekiq).redis_url = 'redis://127.0.0.1:6379/0'
  end
end
