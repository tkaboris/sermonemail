class AddAdminToPastors < ActiveRecord::Migration
  def change
    add_column :pastors, :admin, :boolean, default: false
  end
end
