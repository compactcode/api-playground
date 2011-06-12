class User
  include Mongoid::Document
  field :key
  field :secret
end