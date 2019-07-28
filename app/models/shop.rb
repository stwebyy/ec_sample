class Shop < ActiveRecord::Base
  has_many :item
  has_many :user
  validates :name, presence: true, length: { in: 1..40 }, uniqueness: true
  validates :address, presence: true, length: { minimum: 5 }
  validates :telephone, presence: true, numericality: true
  validates :person, presence: true, uniqueness: true
  validates :hide, inclusion: { in: [true, false] }
end
