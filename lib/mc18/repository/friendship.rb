require "receptacle"

require "mc18/repository/friendship/strategy/in_memory"

module Mc18
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