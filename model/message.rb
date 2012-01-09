require 'sequel'
Sequel::Model.plugin(:schema)

Sequel.connect(ENV['DATABASE_URL'] || "sqlite://message.db")

class Message < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      text :name
      text :message
      timestamp :posted_date
    end
    create_table
  end
end
