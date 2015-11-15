class UserReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :pastor_id, :sermon_id
      t.timestamps
    end
  end
end
