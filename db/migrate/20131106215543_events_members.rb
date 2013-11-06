class EventsMembers < ActiveRecord::Migration
  def change
  	create_table :events_members, id: false do |t|
		  t.references :event, null: false
		  t.references :member, null: false
		end

		# Adding the index can massively speed up join tables. Don't use the
		# unique if you allow duplicates.
		add_index(:events_members, [:event_id, :member_id], unique: true)
  end
end
