class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :movies, :type, :movie_type
  end
end
