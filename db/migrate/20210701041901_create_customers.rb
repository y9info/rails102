class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :short_name
      t.string :origin
      t.string :sq
      t.string :level
      t.string :full_name
      t.string :linkman
      t.text :address
      t.string :phone
      t.string :fax
      t.string :mobile
      t.string :email
      t.string :website
      t.string :main_purchase
      t.text :track_result
      t.text :note

      t.timestamps
    end
  end
end
