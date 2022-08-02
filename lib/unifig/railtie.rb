# frozen_string_literal: true

require 'rails/railtie'

module Unifig
  # @private
  class Railtie < ::Rails::Railtie
    config.before_configuration do
      Rails.run
    end

    rake_tasks do
      load 'tasks/unifig.rake'
    end
  end
end
