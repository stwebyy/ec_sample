class Item < ActiveRecord::Base
  validates :name, presence: true, length: { in: 1..50 }, uniquness: true
  validates :stocks, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :hide, inclusion: { in: [true, false] }
  validates :review, length: { in: 1..200 }
end
