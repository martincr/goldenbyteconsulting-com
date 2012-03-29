require 'sinatra'

configure do
  # Here!
end

# Home page
get '/' do
  erb :index
end

# See http://www.sinatrarb.com/faq.html#partials
helpers do
  def partial template
    erb template, :layout => false
  end
end