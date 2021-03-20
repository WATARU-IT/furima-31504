class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :items

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[一-龥]+\z/, message: 'は全角文字を使用してください' }
    validates :first_name, format: { with: /\A[一-龥]+\z/, message: 'は全角文字を使用してください' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナ文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナ文字を使用してください' }
    validates :encrypted_password, :password, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'Include both letters and numbers' }
    validates :birth_day
  end
end
