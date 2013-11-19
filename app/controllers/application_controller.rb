class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

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

    def current_ability
      @current_ability ||= Ability.new(current_group)
    end
end
 