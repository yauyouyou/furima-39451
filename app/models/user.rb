class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :lastname_zenkaku, presence: true
  validates :firstname_zenkaku, presence: true
  validates :lastname_zenkaku, format: { with: /\A[一-龥ぁ-んァ-ン]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :firstname_zenkaku, format: { with: /\A[一-龥ぁ-んァ-ン]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :lastname_kana_zenkaku, presence: true
  validates :firstname_kana_zenkaku, presence: true
  validates :lastname_kana_zenkaku, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :firstname_kana_zenkaku, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :birthday, presence: true
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
end
