class User < ActiveRecord::Base
  validates :username,  :presence => true,
                        :length => { :minimum => 6},
                        :uniqueness => true
  validates :password,  :presence => true,
                        :length => { :minimum => 6}
  validates :name,  :presence => true
  
  def twitter_authd?(user)
    @user = User.first(:conditions => {:username => user.username})
    if @user.twitter_token
      return true
    end
  end
  
  def linkedin_authd?(user)
    @user = User.first(:conditions => {:username => user.username})
    if @user.linkedin_token
      return true
    end
  end
end
