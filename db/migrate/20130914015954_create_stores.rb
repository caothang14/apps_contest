class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.text :description
      t.text :note
      t.string :pos_x
      t.string :pos_y

      t.timestamps
    end
  end
end
