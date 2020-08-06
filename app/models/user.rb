class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :items
    has_many :purchases

    alpha_num = /\A[a-z]+[0-9]+\z/i
    js = /\A[ぁ-んァ-ン一-龥]/
    js_kana = /\A[ァ-ヶー－]+\z/

    with_options presence: true do
    validates :nickname
    validates :password, format: { with: alpha_num , message: "is invalid. Input half-width characters and number."}
    validates :last_name, format: { with: js, message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: js, message: "is invalid. Input full-width characters."}
    validates :last_name_reading, format: { with: js_kana, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_reading, format: { with: js_kana, message: "is invalid. Input full-width katakana characters."}
    validates :birthday
  end
end

