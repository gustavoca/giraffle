# Allow usage on Vagrant
if defined? BetterErrors
	BetterErrors::Middleware.allow_ip! "10.0.2.2" if Rails.env == :development
	BetterErrors.editor = :sublime
end