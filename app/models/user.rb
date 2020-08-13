class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do       
    validates :nickname
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } #@を含む
    validates :password,format: { with: /\A[a-z0-9]+\z/i } #半角英数字混合
    validates :password_confirmation
    validates :last_name, format: { with: /\A[一-龥ぁ-ん]/ } #全角ひらがな、漢字
    validates :first_name, format: { with: /\A[一-龥ぁ-ん]/ } #全角ひらがな、漢字
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ } #全角カタカナ
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ } #全角カタカナ
    validates :password
    validates :birthday
  end

  has_many :items
  has_many :comments
  has_many :orders

end

# VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i