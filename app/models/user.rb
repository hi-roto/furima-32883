class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, presence: true

  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD }

  VALID_NAME = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  with_options format: { with: VALID_NAME } do
    validates :last_name
    validates :first_name
  end

  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/
  with_options format: { with: VALID_NAME_KANA } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :items
end
