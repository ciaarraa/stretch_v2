class StoreController < ApplicationController
	def index
		debugger
		@user_and_item = Item.and_account
	end
end
