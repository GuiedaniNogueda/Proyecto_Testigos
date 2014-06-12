class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :file_id
      t.integer :creative_id

      t.timestamps
    end
  end
end
