require 'gitguard'

require 'rails'
require 'rails/commands/commands_tasks'

module Gitguard
    class Railtie < ::Rails::Railtie
      generators do
        ::Rails::CommandsTasks.__send__(:prepend, ::Gitguard::Rails::CommandsTasks)
      end

      rake_tasks do
        ::Rake::Application.__send__(:prepend, ::Gitguard::RakeApplication)
      end
    end
end
