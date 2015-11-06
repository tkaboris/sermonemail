class AddPictureToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :picture, :string
  end
end
