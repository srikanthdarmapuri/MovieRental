class AddCountToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :count, :integer
  end
end
