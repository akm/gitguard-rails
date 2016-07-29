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
        $stderr.puts "\e[31m[gitguard] There are files that need to be committed first.\e[0m"
        $stderr.puts "[gitguard] git status"
        system 'git status'
        exit(1)
      end
      yield
      return if clean?
      root_dir = DirSearch.up{|dir| Dir.exist?(File.join(dir, '.git')) }
      raise Error, "Directory not found: .git" unless root_dir
      Dir.chdir(root_dir) do
        cmd = "git add . && git commit -m #{Shellwords.escape(user_command)}"
        puts "\e[34m#{cmd}"
        r = false
        begin
          r = system(cmd)
        ensure
          print "\e[0m"
        end
        raise Error, "Error on #{cmd}" unless r
      end
    end

    def clean?
      system("git diff --exit-code > /dev/null")
    end

  end
end
