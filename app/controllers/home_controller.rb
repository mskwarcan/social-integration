class HomeController < ApplicationController
  require "rubygems"
  require 'twitter_oauth'
  require 'linkedin'
  require 'twitter'
  
  def index
    @user = session[:user]
  end
  
  def linkedin_register
    @user = session[:user]
    
    client = LinkedIn::Client.new('wOR3wSa1SAucusiKkqC3eWVssnYUmBVs08sIETQXaMZVMIxllhTrt3SZGS9Q388P', 'uwDYLi9ELvDdptSmHIDzfDD7HOHEXm0HDK2lcn4QUIzCh3gcs5nZHpS6EFU97i47')
    
    request_token = client.request_token(:oauth_callback => "http://socialintegration.heroku.com/linkedin_oauth")
    @user.linkedin_token = request_token.token
    @user.linkedin_secret = request_token.secret
    @user.save
    
    redirect_to client.request_token.authorize_url
  end
  
  def linkedin_oauth
    @user = session[:user]
    
    client = LinkedIn::Client.new("wOR3wSa1SAucusiKkqC3eWVssnYUmBVs08sIETQXaMZVMIxllhTrt3SZGS9Q388P", "uwDYLi9ELvDdptSmHIDzfDD7HOHEXm0HDK2lcn4QUIzCh3gcs5nZHpS6EFU97i47")
    pin = params[:oauth_verifier]
    atoken, asecret = client.authorize_from_request(@user.linkedin_token, @user.linkedin_secret, pin)
    @user.linkedin_token = atoken
    @user.linkedin_secret = asecret
    @user.save
    
    redirect_to "/"
  end
  
  def register
    #Get user
    @user = session[:user]
    
    #Set client up
    client = TwitterOAuth::Client.new(
    :consumer_key => 'AsAuRyGZP73Pr6863VS4Pg',
    :consumer_secret => '2bNk5FCvT39HzFN8eHPdbpFNKkaJHnxpQkZ6xz17sY'
    )
    
    request_token = client.request_token( :oauth_callback => 'http://socialintegration.heroku.com/twitter_oauth' )
    @user.twitter_token = request_token.token
    @user.twitter_secret = request_token.secret
    @user.save
    redirect_to request_token.authorize_url
  end
  
  def twitter_oauth
    @user = session[:user]
    
    puts "Twitter Oauth"
    client = TwitterOAuth::Client.new(
    :consumer_key => 'AsAuRyGZP73Pr6863VS4Pg',
    :consumer_secret => '2bNk5FCvT39HzFN8eHPdbpFNKkaJHnxpQkZ6xz17sY'
    )
    
     access_token = client.authorize(
       @user.twitter_token,
       @user.twitter_secret,
       :oauth_verifier => params[:oauth_verifier]
     )
     
     @user.twitter_token = access_token.token
     @user.twitter_secret = access_token.secret
     @user.save(false)
     
     redirect_to "/"
   end
   
   def twitter_post
     @user = session[:user]
     
     client = Tweet.client(@user) 
     
     flash[:notice] = "Your post was successful"
     client.update(params[:twitter_post]) # sends a twitter status update
     
     redirect_to "/"
   end

end
