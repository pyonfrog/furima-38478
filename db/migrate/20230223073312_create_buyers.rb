class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :purchased_item, null: false, foreign_key: true
      t.string     :postal_code,    null: false
      t.integer    :sender_area_id, null: false
      t.string     :municipality,   null: false
      t.string     :house_number,   null: false
      t.string     :building_name
      t.string     :tell,           null: false
      t.timestamps
    end
  end
end
