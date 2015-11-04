class CreatePastors < ActiveRecord::Migration
  def change
    create_table :pastors do |t|
      t.string :pastorname
      t.string :email
      t.timestamps
      
    end
  end
end
