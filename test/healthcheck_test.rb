require 'minitest/autorun'
require 'rack/test'
require 'rack/lobster'
require 'aws-healthcheck'

class HealthcheckTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Rack::Builder.app(Rack::Lobster.new) do
      use Healthcheck::Middleware
    end
  end

  def test_returns_200
    get '/healthcheck'
    assert_equal 200, last_response.status
  end

  def test_returns_blank_commit_if_GIT_COMMIT_env_is_not_set
    ENV['GIT_COMMIT'] = nil
    get '/healthcheck'
    json = JSON.parse last_response.body
    assert_equal '', json['commit']
  end

  def test_returns_GIT_COMMIT_env_value_if_set
    ENV['GIT_COMMIT'] = 'test1234'
    get '/healthcheck'
    json = JSON.parse last_response.body
    assert_equal 'test1234', json['commit']
  end
end
