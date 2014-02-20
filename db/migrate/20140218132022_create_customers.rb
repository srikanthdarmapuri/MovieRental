class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.text :address
      
      t.timestamps
    end
  end
end
