class MembersController < ApplicationController
	before_action :set_member, only: [:edit, :update, :destroy]
	before_action :authorize

  def index
    @members = Member.where(group: current_group)
  end

	def new
		@member = Member.new
	end

	def edit
  end

	def create
		@member = Member.new(member_params)

		if @member.save
			redirect_to members_url, notice: 'Member was successfully created.' 
		else
			render 'new'
		end
	end

  def update
		if @member.update(member_params)
      redirect_to members_url, notice: 'Member was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url
  end

	private
		def set_member
      @member = Member.find(params[:id])
    end

		def member_params
			params.require(:member).permit(:name, :email)
		end
end
