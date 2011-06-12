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

class Postcode
  include Mongoid::Document
end

use Rack::Auth::Basic do |key, secret|
  User.where({key: key, secret: secret}).first
end

get '/postcodes/:code/' do
  postcode = Postcode.where({code: params[:code]}).first
  if postcode
    postcode.to_json
  else
    halt 404
  end
end