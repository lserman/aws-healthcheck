module Healthcheck
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == '/healthcheck' && env['SERVER_PORT'] == '8080'
        if compute_checks
          return [200, {'Content-Type' => 'text/plain'}, []]
        else
          return [500, {'Content-Type' => 'text/plain'}, []]
        end
      end
      @app.call(env)
    end

    protected
      def compute_checks
        Healthcheck::Config.instance.checks.inject(true) do |truthiness, check_name|
          truthiness = truthiness && send(check_name + "_check")
        end
      end

      def activerecord_check
        ActiveRecord::Migrator.current_version.present?
        rescue => e
          false
      end

      def cache_check
        Rails.cache.stats.present?
        rescue => e
          false
      end

      def mongoid_check
        session = Mongoid::Sessions.with_name(:default)
        stats = session.command(dbStats: 1) # Mongoid 3+
        stats = stats.first unless stats.is_a? Hash # Mongoid 5
        stats['db'].present?
        rescue => e
          false
      end
  end
end
