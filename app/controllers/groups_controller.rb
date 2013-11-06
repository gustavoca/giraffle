class GroupsController < ApplicationController
	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)

		if @group.save
			redirect_to root_url, notice: 'Signed Up!' 
		else
			render 'new'
		end
	end

	private
		def group_params
			params.require(:group).permit(:group_id, :name, :password, :password_confirmation)
		end

end
