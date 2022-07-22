require 'fileutils'
require 'unifig/rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.on_potential_false_positives = :nothing
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus

  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.disable_monkey_patching!

  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.order = :random
  Kernel.srand config.seed

  config.before(:suite) do
    Dir.mkdir('tmp') unless Dir.exist?('tmp')
    cleanup

    Dir.chdir('tmp') do
      `bundle exec rails new example --minimal`
      Dir.chdir('example') do
        append_to_file('Gemfile', 'gem "unifig-rails", path: "../../"')
        Bundler.with_unbundled_env do
          `bundle install`
        end
      end
    end
  end

  config.after(:suite) do
    cleanup
  end

  config.after do
    in_rails do
      Dir.chdir('config') do
        File.unlink('unifig.yml') if File.exist?('unifig.yml')
      end
    end
  end
end

def cleanup
  Dir.chdir('tmp') do
    FileUtils.rm_rf('example') if Dir.exist?('example')
  end
end

def append_to_file(file, addition)
  File.write(file, "\n#{addition}", mode: 'a')
end

def in_rails(&block)
  Dir.chdir('tmp') do
    Dir.chdir('example', &block)
  end
end

def write_config(yml)
  in_rails do
    Dir.chdir('config') do
      File.write('unifig.yml', yml)
    end
  end
end

def rails_runner(command)
  in_rails do
    Bundler.with_unbundled_env do
      `bundle exec rails runner '#{command}'`
    end
  end
end
