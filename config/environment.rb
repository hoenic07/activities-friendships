
require "pry"
require "active_support/all"

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

require "mc18/use_case/friendship/load_data"
require "mc18/use_case/activity/load_data"

friends_file = "data/friends.json"
activities_file = "data/activities.json"

Mc18::UseCase::Friendship::LoadData.new(file: friends_file).run
Mc18::UseCase::Activity::LoadData.new(file: activities_file).run