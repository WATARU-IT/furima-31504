class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    with_options format:{ with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角文字を使用してください' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナ文字を使用してください' } do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :encrypted_password, :password, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'Include both letters and numbers' }
    validates :birth_day
  end
end
