source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-reloader', require: false
gem 'activerecord', '4.2.5', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sqlite3'
gem 'rake'
gem 'shotgun'
gem 'pry'
gem 'thin'
gem 'tux'
gem 'require_all'
gem 'bcrypt'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
