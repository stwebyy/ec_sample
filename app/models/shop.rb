class Shop < ActiveRecord::Base
  validates :name, presence: true, length: { in: 1..40 }, uniquness: true
  validates :address, presence: true, length: { minimum: 5 }
  validates :telephone, presence: true, numericality: true
  validates :person, presence: true, uniquness: true
  validates :hide, inclusion: { in: [true, false] }
end
