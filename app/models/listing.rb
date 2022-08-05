class Listing
    include include Mongoid::Document
    
    table name: listing, key: id, capacity_mode: on_demand
    
    field :author_id :number
    field :title :string
    field :description :string
    field :price :number
    feild :category :string
end