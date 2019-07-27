class Item < ActiveRecord::Base
  validates :high_rate, :low_rate, numericality: true
end
