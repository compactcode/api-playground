require "bundler/setup"

Bundler.require(:default)

Mongoid.configure do |config|
  name = "api"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

class User
  include Mongoid::Document
end

get '/user/:id' do
  user = User.find(params[:id])
  user.to_json
end