require "mc18/repository/friendship"

require "json"

module Mc18
  module UseCase
    module Friendship
      class LoadData
        def initialize(file:)
          @file = file
        end
  
        attr_reader :file
  
        def run
          load_friends
        end
  
        def load_friends
          json_array = JSON.parse(File.read(file), symbolize_names: true)
          json_array.each do |json|
            model = to_model(json)
            Repository::Friendship.create(model)
          end
        end
  
        def to_model(json)
          json.merge!(
            created_at: Time.at(json[:created_at] / 1000)
          )

          Model::Friendship.new(json)
        end
      end
    end
  end
end