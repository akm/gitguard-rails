require 'gitguard'

module Gitguard
  module DirSearch
    module_function

    class DirNotFound < StandardError
    end
    
    def up(dir = Dir.pwd, &block)
      return dir if yield(dir)
      parent = File.dirname(dir)
      if dir == parent
        return nil
      else
        return up(parent, &block)
      end
    end
  end
end
