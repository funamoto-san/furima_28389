class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname
    validates :email, format: { with: VALID_EMAIL_REGEX } #@を含む
    validates :password,format: { with: VALID_PASSWORD_REGEX } #半角英数字混合
    validates :password_confirmation
    validates :last_name, format: { with: VALID_NAME_REGEX } #全角ひらがな、全角カタカナ、漢字
    validates :first_name, format: { with: VALID_NAME_REGEX } #全角ひらがな、全角カタカナ、漢字
    validates :last_name_reading, format: { with: VALID_NAME_READING_REGEX } #全角カタカナ
    validates :first_name_reading, format: { with: VALID_NAME_READING_REGEX } #全角カタカナ
    validates :password
    validates :birthday
  end

  has_many :items
  has_many :comments
  has_many :orders

end
