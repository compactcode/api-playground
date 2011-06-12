require 'bundler/setup'

Bundler.require(:test)

require './spec/support/mongoid'
require './spec/support/user'
require './spec/support/postcode'

User.create({key: "shanon", secret: "shanon"})
Postcode.create({code: "3031", name: "Kensington"})
