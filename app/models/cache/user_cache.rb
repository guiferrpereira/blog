module Cache
  class UserCache < Cache::PostgresBase
  	def key user
  		{ user: user.email }
  	end
  end
end