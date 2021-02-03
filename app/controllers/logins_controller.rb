class LoginsController < ApplicationController
	skip_before_action :verify_user, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		# raise params.inspect
		@user  = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect_to user_path(@user)
		else
			flash[:error] = "Invalid Credentials. Try Again."
			render :new
		end
	end

	def destroy
		session.delete :user_id

		flash[:message] = "Successfully Logged Out!"
		redirect_to root_path
	end

end
