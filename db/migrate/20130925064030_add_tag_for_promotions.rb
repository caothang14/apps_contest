class AddTagForPromotions < ActiveRecord::Migration
  def change
  	add_column :promotions, :tags, :text
  end
end
