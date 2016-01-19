class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.confirm(user_params)
		if @user
			login(@user)
			flash[:notice] = "Successfully logged in"
			redirect_to user_path
			#Get a blank page atm
		else
			flash[:error] = "Incorrect email or password."
			redirect_to new_session_path
		end

end
