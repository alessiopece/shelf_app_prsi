class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @item = Item.new
    @item.shelf_id = params[:shelf_id] if params.has_key?(:shelf_id)
    @item.title = params[:title] if params.has_key?(:title) 
    if @item.save
      flash[:success] = "Item added!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

end

