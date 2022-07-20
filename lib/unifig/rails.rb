# frozen_string_literal: true

require 'rails/railtie'
require 'unifig'

require_relative 'railtie'
require_relative 'rails/version'

module Unifig
  # @private
  module Rails
    def self.run
      Unifig::Init.load_file(::Rails.root.join('config', 'unifig.yml'), ::Rails.env.to_sym)
    end
  end
end
