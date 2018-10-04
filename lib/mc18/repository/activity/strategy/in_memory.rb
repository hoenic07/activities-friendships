require "mc18/model/activity"

module Mc18
  module Repository
    module Activity
      module Strategy
        class InMemory
          def where(filters:)
            store.find_all do |activity|
              apply_filters(activity, filters)
            end
          end
  
          def create(activity)
            store.push(activity)
          end

          def apply_filters(activity, filters)
            (!filters.key?(:user_ids) || filters[:user_ids].include?(activity.user_id) ) &&
              (!filters.key?(:start_time_from) || activity.start_time >= filters[:start_time_from]) &&
              (!filters.key?(:start_time_to) || activity.start_time <= filters[:start_time_to]) &&
              (!filters.key?(:type) || activity.type == filters[:type])
          end
  
          class << self
            def store
              @store || clear
            end
            def clear
              @store = []
            end
          end
          
          def clear
            self.class.clear
          end
          
          private def store
            self.class.store
          end
        end
      end
    end
  end
end