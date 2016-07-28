module Gitguard
  module Rails
    module CommandsTasks

      TARGET_COMMANDS = %(plugin generate destroy).freeze

      def require_command!(command)
        if TARGET_COMMANDS.include?(command.to_s)
          Gitguard.run("bin/rails #{command} #{argv.join(' ')}"){ super }
        else
          super
        end
      end

    end
  end
end
