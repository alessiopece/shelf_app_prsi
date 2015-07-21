class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @item = Item.new
    @item.shelf_id = params[:shelf_id] if params.has_key?(:shelf_id)
    @item.title = params[:title] if params.has_key?(:title) 
    @item.year = params[:year] if params.has_key?(:year) 
    if @item.save
      flash[:success] = "Item added!"
      Feed.create(:user_id => current_user.id,:category => 1, :shelf_id => @item.shelf.id, :item_id => @item.id)
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
	@item = Item.find_by(id: params[:item_id])
        current_user.feeds.find_by(item_id: @item.id).destroy
	@item.destroy
   	flash[:success] = "Item deleted"
	redirect_to current_user

  end


end

