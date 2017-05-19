class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name
    	t.datetime :time
    	t.integer :creator_id

      t.timestamps null: false
    end
  end
end
