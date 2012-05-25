require 'sinatra'

configure do
  # Here!
end

# Home page
get '/' do
  erb :index
end

get '/what-we-do' do
  erb :what_we_do
end

get '/who-we-are' do
  erb :who_we_are
end

get '/our-clients' do
  erb :our_clients
end

get '/contact-us' do
  erb :contact_us
end

get '/privacy-policy' do
  erb :index
end

get '/terms-and-conditions' do
  erb :index
end

get '/contact-us' do
  erb :index
end

get '/site-map' do
  erb :index
end

# See http://www.sinatrarb.com/faq.html#partials
helpers do
  def partial template
    erb template, :layout => false
  end
end