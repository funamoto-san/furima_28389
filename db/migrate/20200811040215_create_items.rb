class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.integer :price,               null: false
      t.text :explanation,            null: false
      t.integer :user_id,             null: false, foreign_key: true
      t.integer :buyer_id,                         foreign_key: true
      t.integer :category_id,         null: false
      t.integer :state_id,            null: false
      t.integer :delivery_charge_id,  null: false
      t.integer :shipping_region_id,  null: false
      t.integer :shipping_day_id,     null: false
      t.timestamps
    end
  end
end

# | image           | string  | null: false                    |
# | name            | string  | null: false                    |
# | price           | integer | null: false                    |
# | explanation     | text    | null: false                    |
# | category        | integer | null: false                    |
# | state           | integer | null: false                    |
# | delivery_charge | integer | null: false                    |
# | shipping_region | integer | null: false                    |
# | shipping_day    | integer | null: false                    |
# | user_id         | integer | null: false, foreign_key: true |
# | buyer_id        | integer | null: false, foerign_key: true |