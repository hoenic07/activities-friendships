require "json"
require "pry"
require "securerandom"
require "active_support/all"

TYPES = ["running","running","running","cycling","walking","hiking"]
LAST_YEAR_START = Time.new(2017,1,1)
LAST_MONTH_START = Time.now - 30.days
LATEST_DATE = Time.now

NO_OF_USERS = 50

def rand_range(min, max)
  min + rand(max-min)
end


def random_date(earliest_date=LAST_YEAR_START)
  rand_range(earliest_date.to_i,LATEST_DATE.to_i)*1000
end

def random_of_list(list)
  list[rand(list.size)]
end

def generate_activities_for_user(user_id, earliest_date)
  no_of_activities = rand_range(5,20)
  dist_max = rand_range(60,150)

  no_of_activities.times.map do
    dist = rand_range(40,dist_max)*100
    {
      id: SecureRandom.uuid,
      type: TYPES[rand(TYPES.size)],
      user_id: user_id,
      start_time: random_date(earliest_date),
      distance: dist,
      duration: (dist.to_f/1000 * (rand_range(45,70).to_f/10) * 60000).to_i # eg. 5km * 6min/km => to millis
    }
  end
end

def generate_friendships(user_ids)
  remaining_users = user_ids

  (NO_OF_USERS/2).times.map do 
    current_user_id = remaining_users.pop

    no_friends = rand(remaining_users.size)
    friends = remaining_users.sample(no_friends)

    friends.map do |friend_id|
      {
        id: SecureRandom.uuid,
        user_ids: [current_user_id,friend_id],
        created_at: random_date
      }
    end
  end.flatten
end

user_ids =  NO_OF_USERS.times.map { SecureRandom.uuid }
activities_year = user_ids.map { |user_id| generate_activities_for_user(user_id, LAST_YEAR_START) }.flatten 
activities_month = user_ids.map { |user_id| generate_activities_for_user(user_id, LAST_MONTH_START) }.flatten 
friends= generate_friendships(user_ids)

File.write("data/activities.json", JSON.dump(activities_year + activities_month))
File.write("data/friends.json", JSON.dump(friends))

