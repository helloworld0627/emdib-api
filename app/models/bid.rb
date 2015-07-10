class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :buyer, class_name: "User"

  validates_presence_of :bid_status
  validates_numericality_of :bid_price, greater_than: 0
  validates_presence_of :auction
  validates_presence_of :buyer

  enum bid_status: [:begin, :end_win, :end_lose, :cancel]
end
