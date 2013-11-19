class MembersController < ApplicationController
	load_and_authorize_resource

	before_action :set_member, only: [:show, :edit, :update, :destroy]
	before_action :authorize

  def index
    @members = current_group.members
  end

  def show
  end

	def new
		@member = Member.new
	end

	def edit
  end

	def create
		@member = Member.new(member_params)
		@member.group = current_group

		if @member.save
			respond_to do |format|
				format.html { redirect_to members_url, notice: 'Member was successfully created.' }
			end
		else
			render 'new'
		end
	end

  def update
		if @member.update(member_params)
			respond_to do |format|
      	format.html { redirect_to members_url, notice: 'Member was successfully updated.' }
    	end
    else
      render action: 'edit'
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
			format.html { redirect_to members_url, notice: 'Member was successfully deleted.' }
		end
  end

	private
		def set_member
      @member = Member.find(params[:id])
    end

		def member_params
			params.require(:member).permit(:name, :email)
		end
end
