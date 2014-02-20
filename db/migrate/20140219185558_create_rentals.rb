class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :name, :null => false, :references => [:movies, :name]
      t.string :mobile, :null => false, :references => [:customers, :mobile]
      t.references :customer, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
