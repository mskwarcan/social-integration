class HomeController < ApplicationController
  require "rubygems"
  require 'twitter_oauth'
  
  def index
    
  end
  
  def register
    @user = session[:user]
    unless @user.twitter_authd?(@user)
          client = TwitterOAuth::Client.new(
              :consumer_key => '4xm5KPQDlTw3RlQKQuO8qQ',
              :consumer_secret => 'AKvzYoI8WERZghSmK9J3jeY9YnCmcevWGBvdyK5A'
          )
          request_token = client.request_token(:oauth_callback => 'http://socialintegration.heroku.com') 
    end
  end
  
  def oauth_callback
     access_token = client.authorize(
       request_token.token,
       request_token.secret,
       :oauth_verifier => params[:oauth_verifier]
     )

     client.update('checking out the twitter_oauth library') # sends a twitter status update
   end

end
