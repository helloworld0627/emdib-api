require 'rails_helper'

RSpec.describe "Util::Comments", :type => :request do
  describe "GET /util_comments" do
    it "works! (now write some real specs)" do
      get util_comments_path
      expect(response.status).to be(200)
    end
  end
end
