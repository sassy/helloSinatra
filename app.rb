require 'rubygems'
require 'sinatra'
require 'haml'
require './model/message.rb'

get '/' do
  @messages = Message.order_by(:posted_date.desc)
  haml :index
end

post '/' do
  Message.create({
    :name => request[:name],
    :message => request[:message],
    :posted_date => Time.now
  })
  redirect '/'
end
