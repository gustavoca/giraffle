class CreateEventsMembers < ActiveRecord::Migration
  def change
    create_table :events_members do |t|
    	t.references :event,  null: false
      t.references :member, null: false

      t.timestamps
    end

    add_index :events_members, [:event_id, :member_id], unique: true
  end
end
