class ItemReview < ActiveRecord::Base
  belongs_to :item
  validates :review, presence: true, length: { minimum: 1 }, uniqueness: true
end
