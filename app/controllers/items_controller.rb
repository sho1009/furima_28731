class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
   Item.create(tweet_params)
 end

 def destroy
  tweet = Item.find(params[:id])
  tweet.destroy
end

 private
 def item_params
   params.require(:item).permit(:name, :image, :text)
 end

end
