class UsersController < ApplicationController
	skip_before_action :verify_user, only: [:new, :create]

	def index
		@users = User.all
	end
	
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id]) 
	end

	def create
		# raise params.inspect
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
	
end
