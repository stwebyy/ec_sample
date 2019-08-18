class Item < ActiveRecord::Base
  belongs_to :user
  has_many :item_reviews
  has_many :item_categories
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :item_categories
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :cart_items
  has_many :cart, through: :cart_items
  has_one_attached :image
  validates :name, presence: true, length: { in: 1..50 }, uniqueness: true
  validates :stocks, presence: true, numericality: { only_integer: true, greater_than: -1 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :hide, inclusion: { in: [true, false] }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :user_id?

  def user_id?
    i = user_id
    admin = User.find(user_id).admin
    if admin != true
      errors.add(:name, ' はadmin権限を持ったユーザーのみ登録できます。')
    end
  end
end
