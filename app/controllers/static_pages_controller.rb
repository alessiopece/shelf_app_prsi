class StaticPagesController < ApplicationController
  def home
    @shelf = current_user.shelves.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
