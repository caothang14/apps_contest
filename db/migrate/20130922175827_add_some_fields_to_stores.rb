class AddSomeFieldsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :phone_number, :string
    add_column :stores, :working_hours, :string
    add_column :stores, :homepage, :string
  end
end
