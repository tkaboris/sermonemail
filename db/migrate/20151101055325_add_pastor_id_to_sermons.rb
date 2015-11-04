class AddPastorIdToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :pastor_id, :integer
  end
end
