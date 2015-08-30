class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_auth_user

  protected
	def set_auth_user
	  authenticate_or_request_with_http_token do |oauth_access_token, options|
	  	begin
	  	  @graph = Koala::Facebook::API.new(oauth_access_token)
	  	  profile = @graph.get_object("me")
	  	  if profile
	  	  	profile_id = profile["id"]
	  	  	rs = User.find_by(client_id: profile_id)
	  	  	@user = (rs.nil?)? User.create!({client_id: profile_id}) : rs
	  	  end
	  	rescue Exception => e
	  	  render :json => e, :status => e.http_status
	  	end
    end
  end
end
