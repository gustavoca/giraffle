class Member < ActiveRecord::Base
	belongs_to :group
	has_and_belongs_to_many :events

	validates :group, presence: true
	validates :name,  presence: true
	#validates :email, email: true
end
