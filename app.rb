require 'rubygems'
require 'sinatra'
require 'haml'
require './model/message.rb'
require './helpers/auth.rb'

get '/' do
  need_auth do
    @messages = Message.order_by(:posted_date)
    haml :index
  end
end

post '/' do
  Message.create({
    :name => request[:name],
    :message => request[:message],
    :posted_date => Time.now
  })
  redirect '/'
end

get '/login' do
  haml :login
end

post '/login' do
  login
end

get '/logout' do
  haml :logout
end

