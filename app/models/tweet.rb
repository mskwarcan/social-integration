class Tweet < ActiveRecord::Base
  
  private
  def self.client(user)
    @user = user
    
    TwitterOAuth::Client.new(
    :consumer_key => 'AsAuRyGZP73Pr6863VS4Pg',
    :consumer_secret => '2bNk5FCvT39HzFN8eHPdbpFNKkaJHnxpQkZ6xz17sY',
    :token => @user.twitter_token,
    :secret => @user.twitter_secret
    )
  end
end
