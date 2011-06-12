Mongoid.configure do |config|
  name = "api"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end