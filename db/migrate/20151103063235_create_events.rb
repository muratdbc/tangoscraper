class CreateEvents < ActiveRecord::Migration
  def self.up
   create_table :events do |t|
     t.date :eventDate
     t.integer :eventId
     t.timestamps
   end
   create_table :sports do  |t|
    t.text :eventBlob
    t.timestamps
   end
 end

 def self.down
   drop_table :sports
   drop_table :events
 end
end
