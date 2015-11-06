class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :pastor_id, :sermon_id
      t.timestamps
    end
  end
end
