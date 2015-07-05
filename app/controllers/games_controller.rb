class GamesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @game = Game.new
    @game.shelf_id = params[:shelf_id] if params.has_key?(:shelf_id)
    @game.title = params[:title] if params.has_key?(:title) 
    if @game.save
      flash[:success] = "Game added!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  
private


end
