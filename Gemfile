source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'dm_unibo_common', path: '/home/rails/gems/dm_unibo_common/'
# gem 'dm_unibo_common', git: 'https://github.com/donapieppo/dm_unibo_common.git',           branch: 'ver.3'
gem 'dm_unibo_user_search', git: 'https://github.com/donapieppo/dm_unibo_user_search.git', branch: 'master'

gem 'webpacker', '~> 4.0'
gem "ice_cube"

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

