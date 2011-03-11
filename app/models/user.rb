class User < ActiveRecord::Base
  validates :username,  :presence => true,
                        :length => { :minimum => 6},
                        :uniqueness => true
  validates :password,  :presence => true,
                        :length => { :minimum => 6}
  validates :name,  :presence => true
  
  def twitter_authd?(user)
    @user = User.first(:conditions => {:username => user.username})
    if @user.twitter_authenticated == true
      return true
    end
  end
  
  def linkedin_authd?(user)
    @user = User.first(:conditions => {:username => user.username})
    if @user.linkedin_authenticated == true
      return true
    end
  end
  
  def facebook_authd?(user)
    @user = User.first(:conditions => {:username => user.username})
    if @user.facebook_authenticated == true
      return true
    end
  end
  
   def self.facebook(user)

    	FBGraph::Client.new(
    	:client_id => '129898603745111',
    	:secret_id =>'f4a68ca5d87865292897f00b69e8f299',
    	:token => user.facebook_access
    	)
  end
end
