class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  validates :password, length: { minimum: 6 }, format: { with: /[a-z]{1,}[\d]{1,}/, message: 'は半角英数をそれぞれ1文字以上使用してください' }
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字で入力してください(全角英数は除く)' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナで入力してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
