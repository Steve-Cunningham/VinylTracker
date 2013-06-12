class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :title
      t.integer :year
      t.string :label
      t.string :country
      t.string :condition
      t.string :other

      t.timestamps
    end
  end
end
