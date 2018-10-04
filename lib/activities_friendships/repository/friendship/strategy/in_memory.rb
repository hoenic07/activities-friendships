require "activities_friendships/model/friendship"

module ActivitiesFriendships
  module Repository
    module Friendship
      module Strategy
        class InMemory
          def where(user_id:)
            store.find_all do |friendship|
              friendship.user_ids.include?(user_id)
            end
          end
  
          def create(friendship)
            store.push(friendship)
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