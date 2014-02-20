class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :language
      t.integer :year
      t.string :movie_type

      t.timestamps
    end
  end
end
