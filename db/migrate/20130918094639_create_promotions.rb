class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.datetime :begin_date
      t.datetime :end_date
      t.text :description
      t.text :note
      t.string :status
      t.integer :category_id
      t.integer :store_id

      t.timestamps
    end
  end
end
