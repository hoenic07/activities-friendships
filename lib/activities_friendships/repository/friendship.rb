require "receptacle"

require "activities_friendships/repository/friendship/strategy/in_memory"

module ActivitiesFriendships
  module Repository
    module Friendship
      include Receptacle::Repo
      
      mediate :where
      mediate :create
      mediate :clear

      strategy Strategy::InMemory
    end
  end
end