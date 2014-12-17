module Cache
	class PostgresBase < ActiveRecord::Base
    def fetch *args
      obj = get *args
      return obj if obj

      cache *args
    end

		def matching args
			data = key(*args)
			Cache::PostgresBase.where("key -> :k LIKE :v", :k => data.keys.first, :v => data.values.first)
		end 

    def get *raw_key
    	obj = matching(raw_key).try(:first).try(:value)
      Marshal.load(obj) if obj.present?
    end

    def cache *raw_key
      matching(raw_key).first_or_create(:key => key(*raw_key), :value => Marshal.dump(raw_key))
    end
	end
end