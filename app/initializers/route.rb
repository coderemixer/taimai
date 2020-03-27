class Route < Sinatra::Base
  set :show_exceptions, :after_handler
  set :views, settings.root + '/../views'
  register Sinatra::Namespace
  use Rack::Cors do
    allow do
      origins '*'
      resource '/*',
               :methods => [:get, :post, :delete, :put, :patch, :options, :head],
               :headers => :any,
               :expose  => ['Token'],
               :max_age => 600
    end
  end

  namespace '/api', &ROOT_ROUTE

  error 500 do |error|
    [
      500,
      {
        exception: error.class,
        message: error.message,
        backtrace: error.backtrace,
      }.to_json
    ]
  end

  error BaseError do |error|
    error.rack
  end
end
