require 'sinatra'
require 'rack-superfeedr'
require 'cgi'

configure do
  # Application settings
  set :host, ENV['HOST']
  set :login, ENV['SUPERFEEDR_LOGIN']
  set :password, ENV['SUPERFEEDR_PASSWORD']
  
  # List all the feeds you want to subscribe to below.
  set :feeds, [
    'http://blog.superfeedr.com/atom.xml',
    'https://github.com/superfeedr',
    'http://feeds.feedburner.com/avc',
    'http://push-pub.appspot.com/feed'
  ]
  # The datastore... (volatile for this application)
  set :stories, {} 
end

# We use JSON for the data format
use(Rack::Superfeedr, { :host => settings.host, :login => settings.login, :password => settings.password, :format => 'json', :async => true }) do |superfeedr| 
  superfeedr.on_notification do |notification|
    notification['items'].each do |item|
      settings.stories[CGI::escape(item['id'])] = item # keeping the story
    end
  end
  
  # Subscribing to all the feeds we want. 
  # Subscriptions are stateful, so we could avoid resubscribing them everytime we boot the application, 
  # but we want to keep this application stateless for demo purposes
  settings.feeds.each do |url|
    superfeedr.subscribe(url)
  end
end

# Home page
get '/' do
  erb :index
end

# Redirects. Important for marking the stories as read!
get '/read/:id' do
  if params[:id] && entry = settings.stories[params[:id]] 
    settings.stories.delete(params[:id])
    if url = entry['permalinkUrl']
      redirect to(entry['permalinkUrl'])
    end
  else
    halt 404
  end
end