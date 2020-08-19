class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day

  validates :image, presence: true, unless: :was_attached?
  validates :name, presence: true, length: { maximum: 40 } #最大40文字まで
  validates :explanation, presence: true, length: { maximum: 1000 } #最大1000文字
  validates :price, presence: true, numericality: { with: VALID_HALF_WIDTH_DIGIT_REGEX, message: 'は半角数字で入力してください。' } #半角数字で入力
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of range' } 

  validates :category_id, :state_id, :delivery_charge_id, :shipping_region_id, :shipping_day_id, 
  numericality: { other_than: 1, message: 'は「---」以外を選択してください。' }

  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end

end


# {message: 'は---以外を入力してください。'}エラー文はこのオプションで変えれる