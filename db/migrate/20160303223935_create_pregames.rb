class CreatePregames < ActiveRecord::Migration
  def change
    create_table :pregames do |t|
      
      t.integer :event_id
      t.string  :place
      t.text    :address
      t.string  :city
      t.string  :state
      t.integer :zipcode
      t.text    :special
      
      t.timestamps null: false
    end
  end
end
