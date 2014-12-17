module Cache
  module Base
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def fetch *args
        obj = get *args
        return obj if obj

        cached = yield *args
        cache args, cached
        cached
      end

      def get *raw_key
        Rails.cache.read(raw_key)
      end

      def cache raw_key, value
        Rails.cache.write(raw_key, value)
      end
    end
  end
end