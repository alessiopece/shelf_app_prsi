class FilmsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @film = Film.new
    @film.shelf_id = params[:shelf_id] if params.has_key?(:shelf_id)
    @film.title = params[:title] if params.has_key?(:title) 
    if @film.save
      flash[:success] = "Film added!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  

private


end
