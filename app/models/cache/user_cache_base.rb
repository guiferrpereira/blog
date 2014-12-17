module Cache
  class UserCacheBase
  	include Cache::Base

  	def key user
  		{ user: user.email }
  	end
  end
end