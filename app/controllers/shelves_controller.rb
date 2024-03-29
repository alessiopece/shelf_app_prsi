class ShelvesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def create
    @shelf = current_user.shelves.build(shelf_params)


    if @shelf.save
      flash[:success] = "Shelf added!"

      Feed.create(:user_id => current_user.id,:category => 2, :shelf_id => @shelf.id)
	
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    current_user.feeds.find_each do |f|
       if (f.shelf_id == @shelf.id) 
		f.destroy
	end
    end
    @shelf.destroy
	
    flash[:success] = "Shelf deleted"
    redirect_to request.referrer || root_url

  end

private

    def shelf_params
      params.require(:shelf).permit(:category)
    end

    def correct_user
      @shelf = current_user.shelves.find_by(id: params[:id])
      redirect_to root_url if @shelf.nil?
    end

end
