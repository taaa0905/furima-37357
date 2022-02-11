class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  #has_many :comments
  with_options presence: true do
    VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
    VALID_FURIGANA_REGEX = /\A[\p{katakana} ー-&&[^ -~.-˚]]+\z/.freeze
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :first_name, format: { with: VALID_NAME_REGEX, message: '全角文字を使用してください'}
    validates :last_name, format: { with: VALID_NAME_REGEX, message: '全角文字を使用してください'}
    validates :f_first_name, format: { with: VALID_FURIGANA_REGEX, message: '全角カタカナを使用してください'}
    validates :f_last_name, format: { with: VALID_FURIGANA_REGEX, message: '全角カタカナを使用してください'}
    validates :nickname, :dob
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
  end
end
