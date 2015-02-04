class AddColumn < ActiveRecord::Migration
  def change
    add_column :locations, :last_sync_at, :date
  end
end
