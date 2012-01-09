require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

post '/' do
  request[:message]
end


