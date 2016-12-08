module Cache
	class PostgresBase < ActiveRecord::Base
    def fetch *args
      obj = get *args
      return obj if obj

      cached = yield *args
      cache *args, cached
      cached
    end
		
		def matching args
			Cache::PostgresBase.where("key @> '#{key(*args).keys.first}=>#{key(*args).values.first}'")
		end

		def get *raw_key
    	obj = matching(raw_key).try(:first).try(:value)
      Marshal.load(obj) if obj.present?
    end

		def cache *raw_key, value
    	matching(raw_key).first_or_create(:key => key(*raw_key), :value => Marshal.dump(value))
  	end
	end
end
