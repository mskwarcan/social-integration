class HomeController < ApplicationController
  require "rubygems"
  require 'twitter_oauth'
  require 'twitter'
  
  def index
    @user = session[:user]
    
    Twitter.configure do |config|
      config.consumer_key = 'AsAuRyGZP73Pr6863VS4Pg'
      config.consumer_secret = '2bNk5FCvT39HzFN8eHPdbpFNKkaJHnxpQkZ6xz17sY'
      config.oauth_token = @user.twitter_token
      config.oauth_token_secret = @user.twitter_secret
    end
    
  end
  
  def register
    @user = session[:user]
    
    client = Tweet.client(@user)
    
    unless @user.twitter_authd?(@user)
      request_token = client.request_token( :oauth_callback => 'http%3A%2F%2Fsocialintegration.heroku.com%2Ftwitter_oauth' )
      @user.twitter_token = request_token.token
      @user.twitter_secret = request_token.secret
      @user.save(false)
      redirect_to request_token.authorize_url
    end
    
  end
  
  def twitter_oauth
     client = Tweet.client(@user)
     
     access_token = client.authorize(
     @user.twitter_token,
     @user.twitter_secret,
     :oauth_verifier => params[:oauth_verifier]
     )

     @user.twitter_token = access_token.token
     @user.twitter_secret = access_token.secret
     @user.save(false)
     
     redirect_to "/home/index"
   end

end
