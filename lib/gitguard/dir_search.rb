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
        raise DirNotFound, "#{dir} doesn't match the condition"
      else
        begin
          return up(parent, &block)
        rescue DirNotFound
          raise DirNotFound, "#{dir} doesn't match the condition"
        end
      end
    end
  end
end
