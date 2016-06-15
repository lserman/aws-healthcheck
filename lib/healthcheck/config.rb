require 'singleton'

module Healthcheck
  class Config
    # mixin the singleton module
    include Singleton
    # do the actual app configuration
    # {checks: ['activerecord', 'mongoid', 'cache']}
    attr_accessor :checks

    def self.load(config_hash)
      raise Exception.new('Already Configured') if Config.instance.checks.present?
      Config.instance.checks = config_hash[:checks] 
    end
  end
end