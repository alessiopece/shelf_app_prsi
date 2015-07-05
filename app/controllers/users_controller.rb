class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :following, :followers]
before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @shelf = current_user.shelves.build if logged_in?
    @books = Book.all
    @films = Film.all
    @games = Game.all
  end

  def create
   @user = User.new(user_params)  
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Shelf!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

 

# Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
