class Item < ActiveRecord::Base
  has_many :itemreviews
  has_many :item_categories
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :item_categories
  validates :name, presence: true, length: { in: 1..50 }, uniqueness: true
  validates :stocks, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :hide, inclusion: { in: [true, false] }
end
