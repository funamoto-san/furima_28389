class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :price, presence: true

  belongs_to :user
  has_one :order
  has_many :comments

end
