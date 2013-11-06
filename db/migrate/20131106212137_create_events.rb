class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date 			 :date
      t.references :event_set, index: true

      t.timestamps
    end
  end
end
