source 'https://rubygems.org'

gem 'rails', '3.2.3'
## Helpers
gem 'devise'
gem 'slim'
gem 'simple_form'
gem 'jquery-rails'
gem 'jbuilder'
gem "active_model_serializers", :git => "git://github.com/josevalim/active_model_serializers.git"
## Services
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-openid'
gem 'omniauth-google-oauth2'
gem 'twitter'
gem 'faraday'
gem 'resque', :require => "resque/server"
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
 gem 'rspec-rails'
 gem 'simplecov'
 gem 'guard'
 gem 'guard-rspec'
 gem 'growl'
 gem 'capybara'
 gem 'factory_girl'
 gem 'sqlite3'
 gem 'newrelic_rpm'
end
group :production do
  gem 'pg'
end