class Group < ActiveRecord::Base
	has_secure_password
	has_many :members, dependent: :delete_all
	has_many :event_sets, dependent: :delete_all
	has_many :events, through: :event_sets

	validates :name, presence: true
	validates :group_id, presence: true, uniqueness: true
end
