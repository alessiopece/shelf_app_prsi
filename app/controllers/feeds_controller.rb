class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @feed = Feed.new
    @feed.user_id = params[:user_id] if params.has_key?(:user_id)
    @feed.category = params[:category] if params.has_key?(:category)
    @feed.shelf_id = params[:shelf_id] if params.has_key?(:shelf_id)
    @feed.save
     
  end

  def destroy
  end
end
