class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, presence: true, length: { minimum: 6 },format: { with: VALID_PASSWORD_REGEX }
  validates :email, presence: true, uniqueness: true, inclusion: { in: %w(@) }
  validates :passwordpassword_confirmation, presence: true,

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
  validates :read_first, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
  validates :read_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
  validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
  validates :birth, presence: true,
end
