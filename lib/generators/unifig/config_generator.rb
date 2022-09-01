# frozen_string_literal: true

require 'rails/generators'

module Unifig
  # @private
  class ConfigGenerator < ::Rails::Generators::Base
    desc 'Create a Unifig configuration file.'
    def config
      abort 'A configuration file already exists.' if File.exist?(Unifig::Rails::CONFIG_PATH)

      create_file Unifig::Rails::CONFIG_PATH, <<~YML
        unifig:
          providers: local


      YML
    end
  end
end
