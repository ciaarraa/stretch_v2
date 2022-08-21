class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :state, type: StringifiedSymbol, default: :draft

  attr_accessor :state
  validates :state, inclusion: {in: %i[draft available reserved] },
    messgage: " Items must have state draft, available or reserved"
  TRANSITIONS = {
    draft: {publish: :available, edit: :draft, delete: :withdrawn}, 
    available: {edit: :draft, delete: :withdrawn, reserve: :reserved}, 
    reserved: {delete: :withdrawn}
  }

  def perform(action:)
    self[:state] = TRANSITIONS[self[:state]][action] || :error
  end

end
