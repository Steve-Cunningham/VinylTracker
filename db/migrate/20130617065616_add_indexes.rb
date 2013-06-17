class AddIndexes < ActiveRecord::Migration
  def up
    add_index :albums, [:user_id]
  end

  def down
  end
end
