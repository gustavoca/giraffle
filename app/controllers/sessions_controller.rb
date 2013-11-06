class SessionsController < ApplicationController
	def new
	end

	def create
		group = Group.find_by group_id: params[:group_id]

		if group && group.authenticate(params[:password])
			session[:group_id] = group.id
			redirect_to root_url, notice: 'Signed In' 
		else
			flash.now.alert = 'Group Id or Password is invalid!'
			render "new"
		end
	end

	def destroy
		session[:group_id] = nil
		redirect_to root_url, notice: 'Singed Out'
	end
end
