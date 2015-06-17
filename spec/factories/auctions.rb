FactoryGirl.define do
  factory :auction, class: Auction do
    auction_title "need a pumbler"
    auction_status {:cancel}
    auction_start_date  {DateTime.new(2015, 6, 1)}
    auction_end_date {DateTime.new(2015, 6, 2)}
    auction_start_price 5
    auction_end_price 100
    service_loc "47.6097N 122.3331W"
    service_loc_type "coordinate"
    seller_contact "206-335-2555"

    association :seller, 
                factory: :user,
                strategy: :build
  end
end
