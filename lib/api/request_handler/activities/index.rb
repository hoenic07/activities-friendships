require "cgi"
require "dry-validation"
require "errors"

module Api
  module RequestHandler
    module Activities
      class Index

        def initialize(request)
          @request = request
        end

        attr_reader :request

        def filters
          query = parsed_query.deep_symbolize_keys
          params = {}
          params[:user_ids] = query[:user_ids] if query[:user_ids]
          params[:start_time_from] = to_time(query[:start_time_from]) if query[:start_time_from]
          params[:start_time_to] = to_time(query[:start_time_to]) if query[:start_time_to]
          params[:type] = query[:type] if query[:type]
          params
        rescue => e
          raise Errors::RequestInvalid.new(e)
        end

        def parsed_query
          CGI::parse(request.query_string).each_with_object({}) do |(k,v),memo|
            memo[k] = v.first if v.any?
          end
        end

        def to_time(value)
          int_val = Integer(value)
          Time.at(int_val/1000)
        end

        def csv_to_array(val)
          val
        end
      end
    end
  end
end