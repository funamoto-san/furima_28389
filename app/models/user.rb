class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/ # e-mail
    VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/ # 半角アルファベット（大文字・小文字・数値）
    VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/ # 全角ひらがな、漢字
    VALID_NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/ # 全角カタカナ

    validates :nickname
    validates :email, format: { with: VALID_EMAIL_REGEX } #@を含む
    validates :password,format: { with: VALID_PASSWORD_REGEX } #半角英数字混合
    validates :password_confirmation
    validates :last_name, format: { with: VALID_NAME_REGEX } #全角ひらがな、漢字
    validates :first_name, format: { with: VALID_NAME_REGEX } #全角ひらがな、漢字
    validates :last_name_reading, format: { with: VALID_NAME_READING_REGEX } #全角カタカナ
    validates :first_name_reading, format: { with: VALID_NAME_READING_REGEX } #全角カタカナ
    validates :password
    validates :birthday
  end

  has_many :items
  has_many :comments
  has_many :orders

end
