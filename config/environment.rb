
require "active_support/all"

$LOAD_PATH.unshift(File.expand_path("..", __dir__))
$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

if  ENV["ENVIRONMENT"] != "test"

  require "activities_friendships/use_case/friendship/load_data"
  require "activities_friendships/use_case/activity/load_data"

  friends_file = "data/friends.json"
  activities_file = "data/activities.json"

  ActivitiesFriendships::UseCase::Friendship::LoadData.new(file: friends_file).run
  ActivitiesFriendships::UseCase::Activity::LoadData.new(file: activities_file).run
end