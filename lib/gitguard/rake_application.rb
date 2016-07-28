require 'gitguard'

require 'rake/application'

module Gitguard
  module RakeApplication
    def top_level
      if top_level_tasks.any?{|arg| Gitguard.target_rake_task?(arg)}
        Gitguard.run("bin/rake #{top_level_tasks.join(' ')}"){ super }
      else
        super
      end
    end
  end
end
