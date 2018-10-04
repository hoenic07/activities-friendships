require "mc18/repository/activity"

module Mc18
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