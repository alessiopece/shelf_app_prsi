class StaticPagesController < ApplicationController
  def home
    if logged_in?
   # @feed_items = current_user.feed.paginate(page: params[:page])
  
    @shelf = current_user.shelves.build if logged_in?
    @books = Book.all
    @films = Film.all
    @games = Game.all
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
