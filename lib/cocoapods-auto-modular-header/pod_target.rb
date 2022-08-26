# !/usr/bin/env ruby


module Pod
    class PodTarget < Target
  
      def defines_module=(value)
        @defines_module = value
      end
    end
end