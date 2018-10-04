module Mc18
  module Serializer
    module Friendship
      module_function

      def serialize(model)
        {
          id: model.id,
          user_ids: model.user_ids,
          created_at: model.created_at.to_i * 1000
        }
      end
    end
  end
end