class CreateDeliveryInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_infos do |t|

      t.timestamps
      t.string  :postal_code,   null: false
      t.integer :pregecture_id, null: false
      t.string  :city,          null: false
      t.string  :address,       null: false
      t.string  :building
      t.string  :phone_number,  null: false
      t.references :buyers,     foreign_key: true
    end
  end
end