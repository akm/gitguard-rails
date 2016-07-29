require 'gitguard'

require 'yaml'

module Gitguard
  module Config
    extend self

    CONFIG_FILENAME = '.gitguard'.freeze

    def config
      @config ||= load_config
    end

    def load_config
      YAML.load_file(config_path)
    end

    def config_path
      unless @config_path
        dir = DirSearch.up{|dir| File.readable?(File.join(dir, CONFIG_FILENAME)) }
        raise Error, "File not found: #{CONFIG_FILENAME}" unless dir
        @config_path = File.join(dir, CONFIG_FILENAME)
      end
      @config_path
    end

    def rake_task_patterns
      config['tasks'].map{|t| Regexp.new(t) }
    end

    def target_rake_task?(task)
      rake_task_patterns.any?{|ptn| ptn =~ task}
    end
  end
end
