class Book < ApplicationRecord
  # userと紐付ける
  # belongs_to :user
  
  # カラムに対して制限をつけるバリデーション
  validates :title, presence: true, length: { maximum: 50 }
  validates :author, presence: true, length: { maximum: 50 }
  validates :review, presence: true, length: { maximum: 400 }
end
