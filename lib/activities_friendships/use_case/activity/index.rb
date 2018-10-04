require "activities_friendships/repository/activity"

module ActivitiesFriendships
  module UseCase
    module Activity
      class Index
        def initialize(filters:)
          @filters = filters
        end

        attr_reader :filters

        def run
          Repository::Activity.where(filters: filters)
        end
      end
    end
  end
end