require "activities_friendships/repository/friendship"

module ActivitiesFriendships
  module UseCase
    module Friendship
      class Index
        def initialize(user_id:)
          @user_id = user_id
        end

        attr_reader :user_id

        def run
          Repository::Friendship.where(user_id: user_id)
        end
      end
    end
  end
end