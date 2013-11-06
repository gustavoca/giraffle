class Group < ActiveRecord::Base
	has_secure_password

	validates :name, presence: true
	validates :group_id, presence: true, uniqueness: true
end
