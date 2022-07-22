# frozen_string_literal: true

require 'rails/generators'

module Unifig
  # @private
  class ConfigGenerator < ::Rails::Generators::Base
    desc 'Create a Unifig configuration file.'
    def config
      abort 'A configuration file already exists.' if File.exist?(Unifig::Rails::CONFIG_PATH)

      envs = Dir
        .children(File.join('config', 'environments'))
        .map { |f| File.basename(f, '.rb') }
        .sort

      create_file Unifig::Rails::CONFIG_PATH, <<~YML
        config:
          envs:
        #{envs.map { |env| "#{' ' * 4}#{env}:\n#{' ' * 6}providers: local" }.join("\n")}


      YML
    end
  end
end
