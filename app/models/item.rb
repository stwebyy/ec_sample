class Item < ActiveRecord::Base
  belongs_to :shop
  has_many :itemreviews, :category, :itemreview
  has_many :category, through: :item_category
  has_many :item_category
  validates :name, presence: true, length: { in: 1..50 }, uniquness: true
  validates :stocks, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :hide, inclusion: { in: [true, false] }
end
