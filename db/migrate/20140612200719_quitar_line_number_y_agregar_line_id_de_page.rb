class QuitarLineNumberYAgregarLineIdDePage < ActiveRecord::Migration
  def change
  	add_column :pages, :line_id, :integer
  	remove_column :pages, :line_number
  end
end
