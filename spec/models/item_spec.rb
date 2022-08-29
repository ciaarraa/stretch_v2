require 'rails_helper'

RSpec.describe Item do
    describe "validations" do
        it "state" do
            item = Item.create(title: "Test", body: "Meg the stallion")
            expect(item).to validate_inclusion_of(:state).in_array(%i[draft available reserved])
        end
    end

    describe "state" do
        it "has default draft" do
            item = Item.new(title: "Test", body: "item body")
            expect(item[:state]).to be(:draft)
        end
    end  
    describe "#perform" do
        context "when the item is a draft" do
            it "can be published" do
                item = Item.new(title: "Test", body: "item body")
                item.perform(action: :publish)
                expect(item[:state]).to be(:available)
            end

            it "cannot be reserved" do
                item = Item.new(title: "Test", body: "item body")
                item.perform(action: :reserve)
                expect(item[:state]).to be(:error)
            end

            it "can be edited" do
                item = Item.new(title: "Test", body: "item body")
                item.perform(action: :edit)
                expect(item[:state]).to be(:draft)
            end

            it "can be deleted" do
                item = Item.new(title: "Test", body: "item body")
                item.perform(action: :delete)
                expect(item[:state]).to be(:withdrawn)
            end 


        end

        context "when the item is a avaiable" do
            it "can be reserved" do
                item = Item.new(title: "Test", body: "item body")
                item.perform(action: :reserve)
                expect(item[:state]).to be(:reserved)
            end

            it "can be edited " do
                item = Item.new(title: "Test", body: "item body")
                item.perform(action: :edit)
                expect(item[:state]).to be(:draft)
            end

            it "can be deleted" do
                item = Item.new(title: "Test", body: "item body")
                item.perform(action: :delete)
                expect(item[:state]).to be(:withdrawn)
            end
        end

    end
end
