class ItemReview < ActiveRecord::Base
  belongs_to :item
  validates :review, presence: true, length: { minimum: 1 }, uniquness: true
end
