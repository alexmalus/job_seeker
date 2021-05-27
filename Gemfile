source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
# Read the tailwind imports.
gem 'sass-rails', '>= 6'
# FYI: encountered issues with webpacker 6 when the bin/webpack-dev-server was booting up.
# Temporarily use version 5.
gem 'webpacker', '~> 5.0'
gem 'redis', '~> 4.0'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'turbo-rails'

gem 'http', '~> 5.0'
gem "feedjira"
gem 'sidekiq', '~> 6.2', '>= 6.2.1'

# include it like this in your gemfile, if you want the ERB views to automatically reload during development.
gem "view_component", "~> 2.32", require: "view_component/engine"

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'standard', '~> 1.1', '>= 1.1.1'
  gem "rubocop-rspec"
  gem "rubocop-rails"
end

group :test do
  gem 'rspec-sidekiq'
  # vcr dependency.
  gem 'webmock'
  gem 'vcr'
  gem "fakeredis", :require => "fakeredis/rspec"
end
