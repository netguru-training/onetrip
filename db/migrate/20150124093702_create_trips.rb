class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :owner_id
      t.integer :contributors_limit

      t.timestamps null: false
    end
  end
end
