env = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'

Sidekiq.configure_server do |config|
  config.redis = { url: "#{YAML.load_file('config/redis.yml')[env]}/sidekiq" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "#{YAML.load_file('config/redis.yml')[env]}/sidekiq" }
end
