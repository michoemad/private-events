class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:username,:email))
		puts @user.valid?
		
		if @user.valid?
			@user.save
			flash[:notice] = "Success!"
		else
			flash[:notice] = "Failure"
		end
		redirect_to user_url

	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@events = @user.events
		
	end

	def attend
		if !Attendance.create(user_id:session[:user_id],event_id:params[:event_id]).errors
			flash[:notice] = "eshta"
		else
			flash[:notice]= "Not this time"
		end
		redirect_to event_url(params[:event_id])
	end

end
