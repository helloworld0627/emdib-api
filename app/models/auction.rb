class Auction < ActiveRecord::Base
  has_many :bids
  belongs_to :seller, class_name: "User"

  validates_presence_of :auction_title
  validates_presence_of :auction_status
  validates_numericality_of :auction_start_price, greater_than: 0
  validates_numericality_of :auction_end_price, greater_than: :auction_start_price
  validates_presence_of :seller
end
