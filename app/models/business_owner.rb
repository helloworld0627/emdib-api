class BusinessOwner < ActiveRecord::Base
	has_many :bids
	validates_presence_of :client_id
	validates_uniqueness_of :client_id
	validates_format_of :yelp_url, :with => URI::regexp(%w(http https)), :allow_blank => true
end
