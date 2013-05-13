source 'https://rubygems.org'

gem 'rails', '3.2.13.rc1'
gem 'pg'
gem 'thin', '1.4.1'
gem 'haml'
# gem 'rails_admin', '0.4.6' # admin panel

# Geocoding
gem "geocoder"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'better_errors'
end

group :test do
  gem 'capybara', '1.1.4'
  gem 'poltergeist', '1.0.2' # headless javascript testing  
end

group :development, :test do
  gem 'rspec-rails', '2.12.2' # '2.0'
  gem 'factory_girl_rails', '4.1.0'  
  gem 'spork', '0.9.2'
end

group :development, :test, :stage do
  gem 'database_cleaner', '0.8.0'
end

# gem "devise"