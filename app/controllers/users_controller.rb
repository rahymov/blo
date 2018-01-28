class UsersController < ApplicationController
  
	before_action :find_params, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to Blog #{@user.username}"
  		redirect_to articles_path
  	else
  		render 'new'
  	end
  end

  def edit
  	
  end
  def update
  	if @user.update
  		flash[:success] = "Successfully updated your account"
  		redirect_to articles_path
  	else
  		render 'edit'
  	end
  end

  def show
  	
  end

  def destroy
  	
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :password)
  end
  def find_params
  	@user = User.find(params[:id])
  end
end
