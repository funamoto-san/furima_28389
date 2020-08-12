class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do       
    validates :nickname
    validates :email, uniqueness: true, length: { minimum: 6 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, format: { with: /\A[a-z0-9]+\z/i }
    validates :password_confirmation
    validates :last_name
    validates :first_name
    validates :last_name_reading
    validates :first_name_reading
    validates :password
    validates :birthday
  end

  has_many :items
  has_many :comments
  has_many :orders
  
end
