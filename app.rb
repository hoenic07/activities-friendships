# Requires the Gemfile
require 'bundler' ; Bundler.require

require ::File.expand_path("../config/environment", __FILE__)

require 'sinatra/base'
require "api/request_handler/activities/index"
require "mc18/use_case/activity/index"
require "mc18/use_case/friendship/index"
require "api/response_handler/collection"
require "api/response_handler/error"

class App < Sinatra::Base
  get '/activities' do
    filters = Api::RequestHandler::Activities::Index.new(request).filters
    collection = Mc18::UseCase::Activity::Index.new(filters: filters).run
    Api::ResponseHandler::Collection.new(collection).to_rack_response
  end
  
  get '/users/:user_id/friendships' do |user_id|
    collection = Mc18::UseCase::Friendship::Index.new(user_id: user_id).run
    Api::ResponseHandler::Collection.new(collection).to_rack_response
  end
  
  set :show_exceptions, false
  set :raise_errors, false
  
  error do |error|
    Api::ResponseHandler::Error.new(error).to_rack_response
  end
end