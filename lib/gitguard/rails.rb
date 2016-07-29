require "gitguard"

require 'gitguard/rails/railtie'

module Gitguard
  module Rails
    autoload :CommandsTasks, 'gitguard/rails/commands_tasks'
  end
end
