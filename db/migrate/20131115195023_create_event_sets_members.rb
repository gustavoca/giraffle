class CreateEventSetsMembers < ActiveRecord::Migration
  def change
    create_table :event_sets_members, id: false do |t|
      t.references :event_set, null: false
      t.references :member, 	 null: false

      t.timestamps
    end

    add_index :event_sets_members, [:event_set_id, :member_id], unique: true
  end
end
