class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :last_name, :first_name, :last_name_kana, :birth_day, presence: true
  validates :nickname, :email, uniqueness: true
  
  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD }
  
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, format: { with: VALID_NAME }
  validates :first_name, format: { with: VALID_NAME }
  
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, format: { with: VALID_NAME_KANA }
  validates :first_name_kana, format: { with: VALID_NAME_KANA }
  
  
end
