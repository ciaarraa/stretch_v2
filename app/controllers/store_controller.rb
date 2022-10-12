class StoreController < ApplicationController
	def index
		@user_and_item = Item.and_account
	end
end
