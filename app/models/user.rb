class User < ActiveRecord::Base
	has_many :auctions
	validates_presence_of :client_id
	validates_uniqueness_of :client_id
end
