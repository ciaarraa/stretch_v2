class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username, type: String
  field :firsname, type: String
  field :lastname, type: String
  belongs_to :listing
end
