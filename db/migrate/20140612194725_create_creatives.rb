class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.string :creative_name
      t.integer :order_id

      t.timestamps
    end
  end
end
