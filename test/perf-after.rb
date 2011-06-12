require 'bundler/setup'

Bundler.require(:test)

require './spec/support/mongoid'

DatabaseCleaner.clean