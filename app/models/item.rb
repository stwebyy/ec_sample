class Item < ActiveRecord::Base
  has_many :item_reviews
  has_many :item_categories
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :item_categories
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :cart_items
  has_many :cart, through: :cart_items
  validates :name, presence: true, length: { in: 1..50 }, uniqueness: true
  validates :stocks, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :hide, inclusion: { in: [true, false] }
  # validate :prefix_hoge

  # バリデーションメソッド
  # def prefix_hoge
  #   if name != 'hoge' # バリデーションの条件
  #     errors.add(:name, 'hoehohoehoheodehoehoehoho') # エラーメッセージ
  #   end
  # end
end
