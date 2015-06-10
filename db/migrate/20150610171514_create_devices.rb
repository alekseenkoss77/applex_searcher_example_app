class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :manager
      t.string :sim
      t.string :imei
      t.boolean :warranty
      t.string :warranty_expired
      t.string :location
      t.timestamps null: false
    end
  end
end
