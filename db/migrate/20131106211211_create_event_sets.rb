class CreateEventSets < ActiveRecord::Migration
  def change
    create_table :event_sets do |t|
      t.string 		 :name
      t.date 			 :start_date
      t.integer 	 :interval
      t.integer 	 :organizers_per_event
      t.integer    :num_of_members_to_raffle
      t.references :group, index: true

      t.timestamps
    end
  end
end
