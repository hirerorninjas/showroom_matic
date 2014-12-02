class AddUseridToSalesmen < ActiveRecord::Migration
  def change
    add_column :salesmen, :user_id, :integer
  end
end
