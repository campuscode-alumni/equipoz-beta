source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'simple_form'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'rails_12factor', group: :production
gem 'pg',             group: :production

group :development, :test do
  gem 'sqlite3', '~> 1.3.12'
  gem 'byebug', platform: :mri
  gem 'rubocop', require: false
  gem 'rspec-rails'
  gem 'capybara'
  gem 'pry-byebug'
  gem 'factory_girl_rails', '~> 4.0'
end

group :test do
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rubocop'
  gem 'guard-rspec', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
