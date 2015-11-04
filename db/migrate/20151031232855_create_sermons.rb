class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :name
      t.text :summary
      t.text :description
      t.timestamps
    end
  end
end
