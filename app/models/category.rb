class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
  validates :name, presence: true, length: { minimum: 1 }, uniqueness: true
end
