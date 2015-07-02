class ShelvesController < ApplicationController
  def create
    @shelf = current_user.shelves.build(shelf_params)
    if @shelf.save
      flash[:success] = "Shelf added!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

private

    def shelf_params
      params.require(:shelf).permit(:content)
    end
end
