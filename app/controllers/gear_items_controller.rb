class GearItemsController < ApplicationController
  def show
    @item = GearItem.find(params[:id])
  end
end