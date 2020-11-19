module Healthcheck
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == '/healthcheck'
        [ 200, { 'Content-Type' => 'application/json' }, [ body.to_json ] ]
      else
        @app.call env
      end
    end

    private
      def body
        { commit: ENV['GIT_COMMIT'].to_s }
      end
  end
end
