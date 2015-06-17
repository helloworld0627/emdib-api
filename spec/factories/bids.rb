FactoryGirl.define do
  factory :bid do
    bid_price 10
    bid_status {:cancel}
    association :auction,
                factory: :auction,
                strategy: :build

    association :business_owner,
                factory: :business_owner,
                strategy: :build
  end

end