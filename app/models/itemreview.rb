class ItemReview < ActiveRecord::Base
  validates :review, presence: true, length: { minimum: 1 }, uniquness: true
end
