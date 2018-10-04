require "receptacle"

require "activities_friendships/repository/activity/strategy/in_memory"

module ActivitiesFriendships
  module Repository
    module Activity
      include Receptacle::Repo
      
      mediate :where
      mediate :create
      mediate :clear

      strategy Strategy::InMemory
    end
  end
end