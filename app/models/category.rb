class Category < ActiveRecord::Base
  belongs_to :item
  validates :name, presence: true, length: { minimum: 1 }, uniquness: true
end
