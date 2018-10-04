# frozen_string_literal: true

require "server"

describe "Friendships" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  let(:friendship) do
    Mc18::Model::Friendship.new(
      id: "123",
      user_ids: ["1","2"],
      created_at: Time.at(1538637755)
    )
  end

  let(:friendship2) do
    Mc18::Model::Friendship.new(
      id: "123",
      user_ids: ["1","3"],
      created_at: Time.at(1538637755)
    )
  end

  before do
    Mc18::Repository::Friendship.clear
    Mc18::Repository::Friendship.create(friendship)
    Mc18::Repository::Friendship.create(friendship2)
  end

  let(:user_id) { "1" }

  let(:url) { "/users/#{user_id}/friendships" }
  let(:status) { 200 }

  shared_examples "a request" do
    it "gets the expected friendships" do
      get url
      expect(last_response.status).to eq status
      verify(format: :json) { last_response.body }
    end
  end

  it_behaves_like "a request"

  context "friends of user 2" do
    let(:user_id) { "2" }
    it_behaves_like "a request"
  end

  context "friends of user 4" do
    let(:user_id) { "4" }
    it_behaves_like "a request"
  end
end
