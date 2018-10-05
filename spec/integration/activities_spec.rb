# frozen_string_literal: true

require "app"

describe "Activities" do
  include Rack::Test::Methods

  def app
    App
  end

  let(:activity) do
    ActivitiesFriendships::Model::Activity.new(
      id: "123",
      type: "running",
      user_id: "2",
      start_time: Time.at(1538637755),
      duration: 3404,
      distance: 7000
    )
  end

  let(:activity2) do
    ActivitiesFriendships::Model::Activity.new(
      id: "124",
      type: "running",
      user_id: "1",
      start_time: Time.at(1538637755),
      duration: 3404,
      distance: 7000
    )
  end

  before do
    ActivitiesFriendships::Repository::Activity.clear
    ActivitiesFriendships::Repository::Activity.create(activity)
    ActivitiesFriendships::Repository::Activity.create(activity2)
  end

  let(:url) { "/activities" }
  let(:status) { 200 }

  shared_examples "a request" do
    it "gets the expected activities" do
      get url
      expect(last_response.status).to eq status
      verify(format: :json) { last_response.body }
    end
  end

  it_behaves_like "a request"

  context "filters by user_id" do
    context "single user" do
      let(:url) { "/activities?user_ids=1" }
      it_behaves_like "a request"
    end

    context "multiple users" do
      let(:url) { "/activities?user_ids=1,2" }
      it_behaves_like "a request"
    end
  end

  context "filters by type" do
    let(:activity) { super().new(type: "cycling") }
    let(:url) { "/activities?type=cycling" }
    it_behaves_like "a request"
  end

  context "filters by start time" do
    let(:time) { Time.at(1538637755) }
    let(:time_millis) { time.to_i*1000 }

    context "from" do
      let(:activity) { super().new(start_time: time) }
      let(:activity2) { super().new(start_time: time-1) }

      let(:url) { "/activities?start_time_from=#{time_millis}" }
      it_behaves_like "a request"
    end

    context "to" do
      let(:activity) { super().new(start_time: time+1 ) }
      let(:activity2) { super().new(start_time: time) }

      let(:url) { "/activities?start_time_to=#{time_millis}" }
      it_behaves_like "a request"
    end
  end

  context "error cases" do
    let(:url) { "/activities?start_time_from=invalid" }
    let(:status) { 400 }
    it_behaves_like "a request"
  end

end
