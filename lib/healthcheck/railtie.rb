require 'rails'

module Healthcheck
  class Railtie < ::Rails::Railtie
      config.app_middleware.use Healthcheck::Middleware
  end
end