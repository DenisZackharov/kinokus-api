class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :description
      t.string :annotation
      t.integer :duration_in_minutes
      t.date :release_date

      t.timestamps
    end
  end
end
