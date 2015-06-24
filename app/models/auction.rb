class Auction < ActiveRecord::Base
  belongs_to :seller, class_name: "User"
  belongs_to :category, class_name: "Category"
  has_many :bids
  has_many :comments

  validates_presence_of :auction_title
  validates_presence_of :auction_status
  validates_presence_of :category
  validates_numericality_of :auction_start_price, greater_than: 0
  validates_numericality_of :auction_end_price, greater_than: :auction_start_price
  validates_presence_of :seller

  enum auction_status: [:non_progress, :in_progress, :done, :cancel]
end
