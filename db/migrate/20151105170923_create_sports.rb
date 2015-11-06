class CreateSports < ActiveRecord::Migration
  def self.up
   create_table :bars do |t|
     t.integer :eventId
     t.date :eventDate
     t.string :eventTitle
     t.string :eventPrice
     t.string :eventGoogleMapsUrl
     t.text :eventBlob
     t.timestamps
   end
 end
   def self.down
    drop_table :bars
   end
end
