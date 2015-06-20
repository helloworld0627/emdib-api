FactoryGirl.define do
  factory :user, class: User do
    client_id "client_id_1"
  end

  factory :biz_user, class: User do
    client_id "client_id_2"
  end
end