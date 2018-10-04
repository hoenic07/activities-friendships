require "mc18/repository/friendship"

module Mc18
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