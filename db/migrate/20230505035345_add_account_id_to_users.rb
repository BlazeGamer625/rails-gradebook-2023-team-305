class AddAccountIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_id, :integer, default:0
  end
end
