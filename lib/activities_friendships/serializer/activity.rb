module ActivitiesFriendships
  module Serializer
    module Activity
      module_function

      def serialize(model)
        model.to_h.merge(
          start_time: model.start_time.to_i*1000
        )
      end
    end
  end
end