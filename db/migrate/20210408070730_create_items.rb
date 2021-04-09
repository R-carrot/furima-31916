class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :title,           null: false
      t.text       :explain,         null: false
      t.integer    :category_id,     null: false
      t.integer    :state_id,        null: false
      t.integer    :delivery_fee_id, null: false
      t.integer    :pregecture_id,   null: false
      t.integer    :delivery_date_id, null: false
      t.integer    :price,           null: false
      t.references :user,            foreign_key: true
    end
  end
end
