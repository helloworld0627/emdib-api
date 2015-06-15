class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :business_owner
end
