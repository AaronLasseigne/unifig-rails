# frozen_string_literal: true

require 'rails/railtie'
require 'unifig'

require_relative 'railtie'
require_relative 'rails/version'

module Unifig
  # @private
  module Rails
    def self.run
      file_path = ::Rails.root.join('config', 'unifig.yml')
      Unifig::Init.load_file(file_path, ::Rails.env.to_sym) if File.exist?(file_path)
    end
  end
end
