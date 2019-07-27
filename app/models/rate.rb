class Rate < ActiveRecord::Base
  belongs_to :item
  validates :high_rate, :low_rate, numericality: true
end
