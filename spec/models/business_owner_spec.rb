require 'rails_helper'

RSpec.describe BusinessOwner, :type => :model do
	before(:each) do
		@business_owner = FactoryGirl.create(:business_owner)
	end

	context ".save" do
		it "saves an valid business_owner" do
			new_business_owner = FactoryGirl.build(:business_owner, :client_id => "foo")
			expect(new_business_owner.save).to be true
		end

		it "saves with nil client_id" do
			new_business_owner = FactoryGirl.build(:business_owner, :client_id => nil)
			expect(new_business_owner.save).to be false
		end

		it "saves with an empty client_id" do
			new_business_owner = FactoryGirl.build(:business_owner, :client_id => "")
			expect(new_business_owner.save).to be false
		end

		it "saves with invalid url" do
			new_business_owner = FactoryGirl.build(:business_owner,
												   :yelp_url => "asdf")
			expect(new_business_owner.save).to be false
		end
	end

	context ".find_by_client_id" do
		it "finds existing business_owner" do
			found = BusinessOwner.find_by_client_id(@business_owner.client_id)
			expect(found).to eql(@business_owner)
		end

		it "finds non-existing business_owner" do
			new_business_owner = FactoryGirl.build(:business_owner, :client_id => "foo")
			found = BusinessOwner.find_by_client_id(new_business_owner.client_id)
			expect(found).to eql(nil)
		end
	end
end
