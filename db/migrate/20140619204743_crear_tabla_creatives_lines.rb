class CrearTablaCreativesLines < ActiveRecord::Migration
  def change
  	create_table :creatives_lines, id: false do |t|
  		t.belongs_to :creative
  		t.belongs_to :line
  	end
  end
end
