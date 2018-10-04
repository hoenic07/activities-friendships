require "receptacle"

require "mc18/repository/activity/strategy/in_memory"

module Mc18
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