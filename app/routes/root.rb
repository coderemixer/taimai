# @!visibility private
# Leave API docs for API docs
ROOT_ROUTE = proc do
  get '/' do
    'Hello World'
  end

  get '/hello' do
    'Hello API'
  end
end
