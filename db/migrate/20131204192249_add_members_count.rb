class AddMembersCount < ActiveRecord::Migration
  def self.up
  	add_column :groups, :members_count, :integer, :default => 0
  	Group.reset_column_information
  	Group.find(:all).each do |g|
  		g.update_attribute :members_count, g.members.length
  	end
  end

  def self.down
  	remove_column :gropus, :members_count
  end
end
