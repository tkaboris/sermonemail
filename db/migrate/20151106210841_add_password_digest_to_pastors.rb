class AddPasswordDigestToPastors < ActiveRecord::Migration
  def change
    add_column :pastors, :password_digest, :string
  end
end
