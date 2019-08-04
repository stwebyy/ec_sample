class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  validates :stocks, presence: true, numericality: { only_integer: true, greater_than: -1 }
end
