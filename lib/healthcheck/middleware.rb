module Healthcheck
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == '/healthcheck' && env['SERVER_PORT'] = '8080'
        return [200, {}, []] 
      end
      @app.call(env)
    end
  end
end
