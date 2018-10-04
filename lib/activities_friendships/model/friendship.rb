require 'types'

module ActivitiesFriendships
  module Model
    class Friendship < Dry::Struct
      attribute :id,         Types::Strict::String
      attribute :user_ids,   Types::Strict::Array.of(Types::Strict::String)
      attribute :created_at, Types::Strict::Time
    end
  end
end