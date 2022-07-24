# frozen_string_literal: true

require 'rails/railtie'
require 'unifig'

require_relative 'railtie'
require_relative 'rails/version'
require_relative '../generators/unifig/config_generator'

module Unifig
  # @private
  module Rails
    # @private
    CONFIG_PATH = File.join('config', 'unifig.yml')

    def self.run
      file_path = ::Rails.root.join(CONFIG_PATH)
      Unifig::Init.load_file(file_path, env: ::Rails.env.to_sym) if File.exist?(file_path)
    end
  end
end
