source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.1'

gem 'pg'

gem 'bootstrap', '~> 5.3.0'

gem 'jquery-rails'

gem 'sorcery', '~> 0.17.0'

gem 'rails-i18n', '~> 7.0.0'

gem 'draper', '4.0.2'

gem 'carrierwave', '2.2.6'

gem 'pry'

gem 'kaminari', "1.2.2"

gem 'bootstrap5-kaminari-views'

# gem 'ransack', "3.2.1"
gem "ransack", ">= 4.1"

gem 'config'

gem 'enum_help'

gem 'leaflet-rails'

gem 'leaflet-markercluster-rails'

gem 'dotenv-rails'

gem 'fog-aws'

gem 'image_processing', '~> 1.2'

gem 'mini_magick'

gem 'acts-as-taggable-on'

gem 'high_voltage'

gem 'redcarpet'

gem 'meta-tags'

gem 'geokit'

gem 'geokit-rails'

gem 'gon'

gem 'gretel'

gem 'sitemap_generator'

gem 'nokogiri', '>= 1.18.9'

# github dependabotにより追加
gem "net-imap", ">= 0.4.20"
gem "rexml", ">= 3.3.9"
gem "rails-html-sanitizer", ">= 1.6.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# gem "rails", "~> 7.0.8", ">= 7.0.8.4"
gem "rails", "~> 7.1.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
gem "cssbundling-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"
gem "dartsass-rails", "~> 0.4.0"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem 'pry-byebug'
  gem "rspec_junit_formatter"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter"
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem 'letter_opener_web', '~> 3.0'
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "launchy"
end
