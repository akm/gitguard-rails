module Cmd
  module_function

  def run(cmd)
    puts(cmd) if ENV['VERBOSE'] =~ /true|yes|on|1/i
    system("#{cmd}", out: "/dev/null", err: "/dev/null")
  end
end
