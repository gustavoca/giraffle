class GroupsController < ApplicationController
	load_and_authorize_resource
	
	before_action :set_group, only: 	[:edit, :update, :destroy]
	before_action :authorize, except: [:new,  :create]

	def new
		@group = Group.new
	end

	def edit
	end

	def create
		@group = Group.new(group_params)

		if @group.save
			redirect_to root_url, notice: 'Signed Up!' 
		else
			render 'new'
		end
	end

	def update
		if @group.update(group_params)
      redirect_to root_url, notice: 'Group Info was successfully updated.'
    else
      render action: 'edit'
    end
  end

	private
		def set_group
      @group = Group.find(params[:id])
    end

		def group_params
			params.require(:group).permit(:group_id, :name, :password, :password_confirmation)
		end
end
