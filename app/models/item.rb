class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :state, type: StringifiedSymbol, default: :draft

  attr_accessor state

  TRANSITIONS = {
    draft: {publish: :available, edit: :draft}, 
    available: {edit: :available, delete: :withdrawn, reserve: :reserved, request: :available}, 
    reserved: {delete: :withdrawn}
  }

  def perform(action:)
    binding.pry
    self[state] = TRANSITIONS[state][action] || :error
  end

end
