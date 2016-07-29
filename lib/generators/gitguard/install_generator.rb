require 'rails/generators/base'

module Gitguard
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "Generate config file for gitguard"

    def generate_config
      template 'config.yml', '.gitguard'
    end
  end
end
