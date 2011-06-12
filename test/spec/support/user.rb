class User
  include Mongoid::Document
  field :key
  field :secret
  field :email
end