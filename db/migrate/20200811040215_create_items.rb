class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,         null: false
      t.string :name,          null: false
      t.integer :price,        null: false
      t.text :explanation,     null: false
      t.integer :user_id,      null: false, foreign_key: true
      t.integer :buyer_id,                  foreign_key: true
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
# | send_prefecture | integer | null: false                    |
# | shipping_day    | integer | null: false                    |
# | user_id         | integer | null: false, foreign_key: true |
