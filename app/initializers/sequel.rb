env = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'
DB = Sequel.connect(YAML.load(ERB.new(File.read('app/config/db.yml')[env]).result(binding)))
DB.extension(:connection_validator)
DB.pool.connection_validation_timeout = 60
DB.extension(:pagination)
DB.loggers << Logger.new($stdout)
