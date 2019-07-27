class Category < ActiveRecord::Base
  has_many :item, through: :item_category
  has_many :item_category
  validates :name, presence: true, length: { minimum: 1 }, uniquness: true
end
