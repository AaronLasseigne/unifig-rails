# frozen_string_literal: true

require 'tty-table'

namespace :unifig do
  desc 'List Unifig variable information'
  task vars: :environment do
    table = TTY::Table.new(header: %w[Var Value Provider Required Method]) do |t|
      Unifig::Vars.list.each do |var|
        t << [var.name, %("#{var.value.gsub('"', '\"')}"), var.provider, var.required?, ".#{var.method}"]
      end
    end

    puts table.render(:unicode, padding: [1, 1, 0, 1])
  end
end
