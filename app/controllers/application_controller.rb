class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def current_group
  		@current_group ||= Group.find(session[:group_id]) if session[:group_id] 
  	end
  	helper_method :current_group

  	def group_signed_in?
  		!!current_group
  	end
  	helper_method :group_signed_in?

  	def authorize
  		redirect_to sign_in_url, notice: 'Not authorized' if !group_signed_in?
  	end
end
 