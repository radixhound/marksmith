require "rails/generators"

module Marksmith
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Creates a Marksmith initializer."

      def create_initializer_file
        template "initializer/marksmith.tt", "config/initializers/marksmith.rb"
      end
    end
  end
end
