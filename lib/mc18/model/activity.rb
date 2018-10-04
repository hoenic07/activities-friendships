require 'types'

module Mc18
  module Model
    class Activity < Dry::Struct
      attribute :id,         Types::Strict::String
      attribute :type,       Types::Strict::String      
      attribute :user_id,    Types::Strict::String
      attribute :start_time, Types::Strict::Time
      attribute :distance,   Types::Strict::Integer
      attribute :duration,   Types::Strict::Integer
    end
  end
end