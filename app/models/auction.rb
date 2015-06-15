class Auction < ActiveRecord::Base
  belongs_to :seller
  has_many :bids
end
