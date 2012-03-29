require 'sinatra'

configure do
  # Here!
end

# Home page
get '/' do
  erb :index
end
