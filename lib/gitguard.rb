require "gitguard/version"
require 'gitguard/railtie'

module Gitguard
  autoload :Config   , 'gitguard/config'
  autoload :DirSearch, 'gitguard/dir_search'
  autoload :Rails    , 'gitguard/rails'
  autoload :RakeApplication, 'gitguard/rake_application'
  autoload :Runner   , 'gitguard/runner'

  class Error < StandardError
  end
  
  class << self
    def run(user_command, &block)
      Runner.new(user_command).execute(&block)
    end

    def target_rake_task?(task)
      Config.target_rake_task?(task)
    end

    def enabled?
      !disabled?
    end

    def disabled?
      ENV['GITGUARD'] =~ /false|no|off|0/i
    end
  end
end
