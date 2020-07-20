require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || "sqlite://message.db")

class Message < Sequel::Model
  DB.create_table?(:message) do
    primary_key :id
    text :name
    text :message
    timestamp :posted_date
  end
end
