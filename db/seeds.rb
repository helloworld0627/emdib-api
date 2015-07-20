# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

me = User.create({:client_id => "10103386586799808"})
biz = User.create({:client_id => "110487422327983"})

category_service = Category.create({:name => "services"})
category_housing = Category.create({:name => "housing"})
sub_categories = Category.create(
   [{:name => "parking / storage", :parent => category_housing},
	{:name => "office / commerical", :parent => category_housing},
	{:name => "legal", :parent => category_service},
	{:name => "pet", :parent => category_service},
	{:name => "yard", :parent => category_service}])

category_yard = sub_categories.last
auctions = Auction.create(
    [{
    	:auction_title => "Help yard",
    	:auction_status => :cancel,
    	:auction_desc => "need inspection",
    	:auction_start_price => 30,
    	:auction_end_price => 70,
    	:auction_start_date => Time.new(2015, 05, 01),
    	:auction_end_date => Time.new(2015, 06, 01),
    	:longtitude => 100,
        :latitude => 20,
        :category => category_yard,
    	:seller => me
      }
	])

auction_yard = auctions.first
bids = Bid.create(
    [{
    	:bid_price => 7,
    	:bid_status => :cancel,
    	:auction => auction_yard,
    	:buyer => biz
     }
    ])

comments = Comment.create(
	[{
		:content => "greeting",
		:user => biz,
		:auction => auction_yard
	}])


