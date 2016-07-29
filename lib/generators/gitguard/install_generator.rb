require 'rails/generators/base'

module Gitguard
  module Genrators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Generate config file for gitguard-rails"

      def generate_config
        template '.gitguard', "config.yml"
      end
    end
  end
end
