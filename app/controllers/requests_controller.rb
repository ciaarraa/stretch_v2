class RequestsController < ApplicationController
  def index
    @items = Item.where.not(created_by: nil)
  end

  # def show
  #   @item = Item.where("requested_by.": nameparams)
  # end
end
