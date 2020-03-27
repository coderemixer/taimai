env = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'
redis_url = YAML.load(ERB.new(File.read('app/config/redis.yml')[env]).result(binding))
Ohm.redis = Redic.new("#{redis_url}/database")
