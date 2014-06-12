class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :line_number
      t.integer :creative_id

      t.timestamps
    end
  end
end
