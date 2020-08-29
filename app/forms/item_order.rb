class ItemOrder

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_region_id, :city, :house_number, :building_name, :tel_number, :item_id, :user_id, :order_id

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ #郵便番号（ハイフンあり7桁）
  VALID_TEL_NUMBER_REGEX = /\A\d{10}$|^\d{11}\z/ #電話番号（ハイフンなし10桁or11桁）

  validates :token,                       presence: true
  validates :postal_code,                 presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :shipping_region_id,          presence: true, numericality: { other_than: 1 }
  validates :city,                        presence: true
  validates :house_number,                presence: true
  validates :tel_number,                  presence: true, format: { with: VALID_TEL_NUMBER_REGEX }

  def save
    order = Order.create(
      user_id: user_id, 
      item_id: item_id
    )
    
    Address.create(
      postal_code: postal_code, 
      shipping_region_id: shipping_region_id, 
      city: city, 
      house_number: house_number, 
      building_name: building_name, 
      tel_number: tel_number,
      order_id: order.id
    )
  end

end