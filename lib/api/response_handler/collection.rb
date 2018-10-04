require "activities_friendships/serializer/friendship"
require "activities_friendships/serializer/activity"

module Api
  module ResponseHandler
    class Collection

      SERIALIZER_MAPPING = {
        "ActivitiesFriendships::Model::Friendship" => ActivitiesFriendships::Serializer::Friendship,
        "ActivitiesFriendships::Model::Activity" => ActivitiesFriendships::Serializer::Activity
      }

      def initialize(collection)
        @collection = collection
      end

      def to_rack_response
        [status, headers, [body]]
      end

      private

      attr_reader :collection

      def status
        200
      end

      def headers
       { "Content-Type" => "application/json" }
      end

      def body
        serialized_collection = collection.map do |item|
          serializer = SERIALIZER_MAPPING[item.class.to_s]
          serializer.serialize(item)
        end

        JSON.dump(serialized_collection)
      end
    end
  end
end