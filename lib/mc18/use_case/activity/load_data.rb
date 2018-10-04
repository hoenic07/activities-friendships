require "mc18/repository/activity"

require "json"

module Mc18
  module UseCase
    module Activity
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
            Repository::Activity.create(model)
          end
        end
  
        def to_model(json)
          json.merge!(
            start_time: Time.at(json[:start_time] / 1000)
          )

          Model::Activity.new(json)
        end
      end
    end
  end
end