class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_user

  protected
	def set_user
	  authenticate_or_request_with_http_token do |oauth_access_token, options|
	  	begin
	  	  @graph = Koala::Facebook::API.new(oauth_access_token)
	  	  profile = @graph.get_object("me")
	  	  @user = User.find_by(client_id: profile["id"])
	  	rescue Exception => e
	  	  render :json => e, :status => e.http_status
	  	end
    end
  end
end
