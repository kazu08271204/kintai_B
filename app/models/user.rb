class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 } # 存在性、文字数の検証
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # メールアドレスの正規表現
  validates :email, presence: true, length: { maximum: 100 }, # 存 在性、文字数の検証
                    format: { with: VALID_EMAIL_REGEX}, # メールアドレスの有効性
                    uniqueness: true # 一意性
  has_secure_password # ハッシュ化しデータベースに保存
  validates :password, presence: true, length: { minimum: 6 }
end
