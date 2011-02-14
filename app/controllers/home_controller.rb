class HomeController < ApplicationController
  require "rubygems"
  require 'twitter_oauth'
  
  def index
    
  end
  
  def register
    @user = session[:user]
    
    puts "User created"
    
    client = TwitterOAuth::Client.new(
    :consumer_key => '4xm5KPQDlTw3RlQKQuO8qQ',
    :consumer_secret => 'AKvzYoI8WERZghSmK9J3jeY9YnCmcevWGBvdyK5A',
    :token => @user.twitter_token,
    :secret => @user.twitter_secret
    )
    
    puts "Client created"
    
    unless @user.twitter_authd?(@user)
      puts "Client not authorized"
      request_token = client.request_token( :oauth_callback => 'http%3A%2F%2Fsocialintegration.heroku.com%2F/twitter_oauth' )
      puts "Get Tokens"
      @user.twitter_token = request_token.token
      puts request_token.token
      @user.twitter_secret = request_token.secret
      puts request_token.secret
      @user.save(false)
      puts "Save"
      redirect_to request_token.authorize_url
    end
    
  end
  
  def twitter_oauth
     client = TwitterOAuth::Client.new(
     :consumer_key => '4xm5KPQDlTw3RlQKQuO8qQ',
     :consumer_secret => 'AKvzYoI8WERZghSmK9J3jeY9YnCmcevWGBvdyK5A',
     :token => @user.twitter_token,
     :secret => @user.twitter_secret
     )
     
     access_token = client.authorize(
     @user.twitter_token,
     @user.twitter_secret,
     :oauth_verifier => params[:oauth_verifier]
     )

     @user.twitter_token = access_token.token
     @user.twitter_secret = access_token.secret
     @user.save(false)
   end

end
