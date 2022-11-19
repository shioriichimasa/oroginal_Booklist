class User < ApplicationRecord
  # 文字をすべて小文字に変換する処理
  before_save { self.email.downcase! }
  # バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  # ログイン認証のための準備を良しなに用意してくれる
  has_secure_password
end
