require 'rails'

module Healthcheck
  class Railtie < ::Rails::Railtie

    initializer 'healthcheck.middleware' do |_|
      config.middleware.use Healthcheck::Middleware
    end

  end
end