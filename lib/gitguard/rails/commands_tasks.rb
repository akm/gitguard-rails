module Gitguard
  module Rails
    module CommandsTasks

      TARGET_COMMANDS = %(plugin generate destroy).freeze

      def require_command!(command)
        if target?(command.to_s)
          Gitguard.run("bin/rails #{command} #{argv.join(' ')}"){ super }
        else
          super
        end
      end

      def target?(command)
        return false if argv.empty?
        Gitguard.enabled? && TARGET_COMMANDS.include?(command) &&
          (command == 'generate' ? !argv.include?('gitguard:install') : true)
      end

    end
  end
end
