class SessionsController < ApplicationController
	def new

	end

	def create 
		@name = params[:session][:name]
		@u = User.find_by(username: @name)
		if @u
			flash[:notice]="7elw"
			session[:user_id]= @u.id
		else
			flash[:notice] = "el3ab ya brens"
		end
		redirect_to login_path
	end

	def destroy
		reset_session
		redirect_to login_path
	end


end
