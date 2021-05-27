ENV['RAILS_ENV'] = 'test'

require 'spec_helper'

begin
  require File.expand_path('../../config/environment', __FILE__)
rescue StandardError => e
  # Fail fast if application couldn't be loaded
  $stdout.puts "Failed to load the app: #{e.message}\n#{e.backtrace.take(5).join("\n")}"
  exit(1)
end

# Prevent from running in non-test environment
abort("The Rails environment is running in #{Rails.env} mode!") unless Rails.env.test?

require 'rspec/rails'

# support/ files contain framework configurations and helpers
Dir[File.join(__dir__, 'support/**/*.rb')].sort.each { |file| require file }

RSpec.configure do |c|
  c.include RssFeed
end

RSpec.configure do |config|
  # Wrap each example into a transaction to avoid DB state leak
  config.use_transactional_fixtures = true

  # See https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.define_derived_metadata(file_path: %r{/spec/}) do |metadata|
    # do not overwrite type if it's already set
    next if metadata.key?(:type)

    match = metadata[:location].match(%r{/spec/([^/]+)/})
    metadata[:type] = match[1].singularize.to_sym
  end

  # Named routes are not available in specs by default, add them.
  config.include Rails.application.routes.url_helpers

  config.filter_rails_from_backtrace!

  # Request/Rack middlewares
  config.filter_gems_from_backtrace 'railties', 'rack', 'rack-test'

  # Add `travel_to`
  # See https://andycroll.com/ruby/replace-timecop-with-rails-time-helpers-in-rspec/
  config.include ActiveSupport::Testing::TimeHelpers

  config.after do
    Rails.cache.clear

    # Make sure every example starts with the current time
    travel_back

    if defined?(ActionMailer)
      # Clear deliveries
      ActionMailer::Base.deliveries.clear
    end
  end
end

def rss_entries
  Feedjira.parse(sample_rss_feed).entries
end

def rss_entry
  rss_entries.first
end
