class CreateSermonCategories < ActiveRecord::Migration
  def change
    create_table :sermon_categories do |t|
      t.integer :category_id, :sermon_id
    end
  end
end
