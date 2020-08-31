class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, format: { with: /[@]/, message: 'include @' }
  # - メールアドレスは、必須である/一意性である uniqueness: true,/@を含む必要がある
  validates :password, length: { minimum: 6 }, format: { with: /[a-z]{1,}[\d]{1,}/, message: 'include both letters and numbers' }
  # - パスワードは、必須である/6文字以上である/半角英数字混合である/確認用を含めて2回入力する
  # validates :password_confirmation, length: { minimum: 6 }, format: { with: /[a-z]{1,}[\d]{1,}/, message: 'include both letters and numbers' }
  # - パスワードは、必須である/6文字以上である/半角英数字混合である/確認用を含めて2回入力する
  
  with_options presence: true do
    validates :nickname
    # - ニックネームは、必須である
    validates :birthday
    # - 生年月日が必須である
  end
  with_options presence: true , format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :first_name
    # - ユーザー本名は、必須である/全角（漢字・ひらがな・カタカナ）で入力する
    validates :last_name 
    # - ユーザー本名は、必須である/全角（漢字・ひらがな・カタカナ）で入力する
  end
  with_options presence: true , format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_kana
    # - ユーザー本名のフリガナは、必須である/全角（カタカナ）で入力する
    validates :last_name_kana
    # - ユーザー本名のフリガナは、必須である/全角（カタカナ）で入力する
  end
end