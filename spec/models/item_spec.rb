require 'rails_helper'

RSpec.describe Item, "#perform" do
    context "when the item is a draft" do
        it "can be published" do
            item = Item.new(title: "Test", body: "item body", state: :draft)

            item.perform(action: :publish)

            expect(item.state).to be(:available)
        end

        it "cannot be reserved" do
            
        end
    end

end
