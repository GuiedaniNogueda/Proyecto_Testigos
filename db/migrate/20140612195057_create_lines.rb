class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :line_number
      t.integer :format_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
