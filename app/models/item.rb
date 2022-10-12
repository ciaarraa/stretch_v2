class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :state, type: StringifiedSymbol, default: :draft

  belongs_to :user
 
  TRANSITIONS = {
    draft: {publish: :available, edit: :draft, delete: :withdrawn}, 
    available: {edit: :draft, delete: :withdrawn, reserve: :reserved}, 
    reserved: {delete: :withdrawn}
  }.freeze

  validates :state, inclusion: {in: TRANSITIONS.keys, 
    messgage: " Items must have state draft, available or reserved"}
  
  
  def perform(action:)
    self[:state] = TRANSITIONS[self[:state]][action] || :error
  end

  def self.and_account
    k = Item.all.map do |item|
      [item => User.find(item.user_id).email]
    end.flatten.reduce(:merge)
    k
  end
end
