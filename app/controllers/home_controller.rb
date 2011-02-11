class HomeController < ApplicationController
  require "rubygems"
  require "twitter_oauth"
  
  def index
    
  end
  
  def register
    @twitter_client = TwitterOAuth::Client.new(
      :consumer_key     => '4xm5KPQDlTw3RlQKQuO8qQ',
      :consumer_secret  => 'AKvzYoI8WERZghSmK9J3jeY9YnCmcevWGBvdyK5A'
    )
    request_token = @twitter_client.request_token(:oauth_callback => 'http://socialintegration.heroku.com')
    
  end
  
  def oauth_callback
     @twitter_client = TwitterOAuth::Client.new(
     :consumer_key     => '4xm5KPQDlTw3RlQKQuO8qQ',
     :consumer_secret  => 'AKvzYoI8WERZghSmK9J3jeY9YnCmcevWGBvdyK5A'
     )

     @twitter_access_token = @twitter_client.authorize(
       session[:request_token],
       session[:request_token_secret],
        auth_verifier =>params[:oauth_verifier]
     )
   end

end
