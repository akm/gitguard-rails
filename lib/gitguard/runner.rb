require 'gitguard'
require 'shellwords'

require 'yaml'

module Gitguard
  class Runner
    attr_reader :user_command
    def initialize(user_command)
      @user_command = user_command
    end

    def execute(&block)
      unless clean?
        $stderr.puts "\e[31m[gitguard] There are files that need to be committed first. Run `git status`\e[0m"
        exit(1)
      end
      yield
      root_dir = DirSearch.up{|dir| Dir.exist?(File.join(dir, '.git')) }
      Dir.chdir(root_dir) do
        cmd = "git add . && git commit -m #{Shellwords.escape(user_command)}"
        unless system(cmd)
          raise Error, "Error on #{cmd}"
        end
      end
    end

    def clean?
      system("git diff --exit-code > /dev/null")
    end

  end
end
