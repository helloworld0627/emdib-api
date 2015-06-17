require 'rails_helper'

RSpec.describe User, :type => :model do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	context ".save" do
		new_user = FactoryGirl.build(:user, :client_id => "foo")
		it "saves an valid user" do
			new_user = FactoryGirl.build(:user, :client_id => "foo")
			expect(new_user.save).to be true
		end

		it "saves with nil client_id" do
			new_user = FactoryGirl.build(:user, :client_id => nil)
			expect(new_user.save).to be false
		end

		it "saves with an empty client_id" do
			new_user = FactoryGirl.build(:user, :client_id => "")
			expect(new_user.save).to be false
		end
	end

	context ".find_by_client_id" do
		it "finds existing user" do
			found = User.find_by_client_id(@user.client_id)
			expect(found).to eql(@user)
		end

		it "finds non-existing user" do
			new_user = FactoryGirl.build(:user, :client_id => "foo")
			found = User.find_by_client_id(new_user.client_id)
			expect(found).to eql(nil)
		end
	end
end
