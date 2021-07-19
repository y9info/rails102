class AddUserIdToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :user_id, :integer
  end
end
