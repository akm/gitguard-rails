module Cmd
  module_function

  def run(cmd)
    puts cmd
    r = system("#{cmd}", out: "/dev/null", err: "/dev/null")
    # puts(r ? "\e[32mSuccess: #{cmd}\e[0m" : "\e[31mError: #{cmd}\e[0m")
    r
  end
end
