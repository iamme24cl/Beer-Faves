class LoginsController < ApplicationController
	skip_before_action :verify_user, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		# raise params.inspect
		if auth
			@user = User.find_or_create_by(email: auth['info']['email']) do |u|
				u.username = auth['info']['name']
				u.password = SecureRandom.hex
			end
			# raise auth.inspect
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			@user  = User.find_by(email: params[:email])
			if @user && @user.authenticate(params[:password])
				session[:user_id] = @user.id 
				redirect_to user_path(@user)
			else
				flash[:error] = "Invalid Credentials. Try Again."
				render :new
			end
		end
	end

	def destroy
		session.delete :user_id

		flash[:message] = "Successfully Logged Out!"
		redirect_to root_path
	end

	private

	def auth
		request.env['omniauth.auth']
	end

end
