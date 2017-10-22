class Listing < ActiveRecord::Base
  validates :price, numericality: { only_integer: true, greater_than: 10, less_than_or_equal_to: 10000 }
  validates :country, presence: true
  validates :address, length: { minimum: 6, maximum: 255 }
  validates :price, presence: true
  validates :address, presence: true
end
