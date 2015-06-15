class User < ActiveRecord::Base
	has_many :auctions
end
