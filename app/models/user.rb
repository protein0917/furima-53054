class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  
  validates :birthday, presence: true

  validates :first_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  },presence: true

  validates :last_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  },presence: true

  validates :first_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  },presence: true

  validates :last_name_kana,format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  },presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

end
