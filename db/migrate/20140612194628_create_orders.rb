class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.string :campaign
      t.integer :agency_id
      t.date :start_date
      t.date :end_date
      t.integer :site_id

      t.timestamps
    end
  end
end
