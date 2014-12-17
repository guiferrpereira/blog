class User < ActiveRecord::Base
	def full_name
		Cache::UserCache.new.fetch self do
			self.first_name + " " + self.last_name
		end
	end

	def full_name_2
		Cache::UserCacheBase.fetch self do
			self.first_name + " " + self.last_name
		end
	end
end