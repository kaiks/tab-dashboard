source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '~> 2.4.0'
gem 'rails', '~> 5.1.3.rc2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

#gem 'bootstrap-datepicker-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.0.0.alpha6'

gem 'momentjs-rails'
gem 'rails_bootstrap_sortable'


gem 'high_voltage'
gem 'jquery-rails'

gem 'devise'
gem 'bcrypt', platforms: :ruby #https://github.com/codahale/bcrypt-ruby/issues/142

gem 'gon'

group :development do
  gem 'better_errors'
  gem 'rails_apps_pages'
  gem 'rails_apps_testing'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end
group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
